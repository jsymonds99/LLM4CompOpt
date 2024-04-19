; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) #0 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %3, %1
  %accumulator.tr = phi i32 [ 1, %1 ], [ %5, %3 ]
  %.tr = phi i32 [ %0, %1 ], [ %4, %3 ]
  %2 = icmp eq i32 %.tr, 0
  br i1 %2, label %6, label %3

3:                                                ; preds = %tailrecurse
  %4 = add nsw i32 %.tr, -1
  %5 = mul nsw i32 %accumulator.tr, %.tr
  br label %tailrecurse

6:                                                ; preds = %tailrecurse
  %accumulator.ret.tr = mul nsw i32 %accumulator.tr, 1
  ret i32 %accumulator.ret.tr
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %3, %1
  %.01 = phi i32 [ 1, %1 ], [ %4, %3 ]
  %.0 = phi i32 [ 1, %1 ], [ %5, %3 ]
  %.not = icmp sgt i32 %.0, %0
  br i1 %.not, label %6, label %3

3:                                                ; preds = %2
  %4 = mul nsw i32 %.01, %.0
  %5 = add nuw nsw i32 %.0, 1
  br label %2, !llvm.loop !6

6:                                                ; preds = %2
  ret i32 %.01
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %16, %2
  %.02 = phi i32 [ 0, %2 ], [ %.1, %16 ]
  %.01 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %4 = icmp slt i32 %.01, %0
  br i1 %4, label %5, label %18

5:                                                ; preds = %3
  %6 = add nsw i32 %.02, %.01
  br label %7

7:                                                ; preds = %9, %5
  %.1 = phi i32 [ %6, %5 ], [ %14, %9 ]
  %.0 = phi i32 [ 0, %5 ], [ %15, %9 ]
  %8 = icmp slt i32 %.0, %1
  br i1 %8, label %9, label %16

9:                                                ; preds = %7
  %10 = tail call i32 @recursive_factorial(i32 noundef %.01)
  %11 = tail call i32 @normal_factorial(i32 noundef %.0)
  %12 = sub nsw i32 %.1, %.0
  %13 = sub nsw i32 %10, %11
  %14 = add nsw i32 %12, %13
  %15 = add nuw nsw i32 %.0, 1
  br label %7, !llvm.loop !8

16:                                               ; preds = %7
  %17 = add nuw nsw i32 %.01, 1
  br label %3, !llvm.loop !9

18:                                               ; preds = %3
  ret i32 %.02
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = tail call i32 @doing_something(i32 noundef 1, i32 noundef 2)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1, i32 noundef 2, i32 noundef %3) #3
  %5 = tail call i32 @doing_something(i32 noundef 6, i32 noundef 3)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 6, i32 noundef 3, i32 noundef %5) #3
  %7 = tail call i32 @doing_something(i32 noundef 2, i32 noundef 4)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 2, i32 noundef 4, i32 noundef %7) #3
  %9 = tail call i32 @doing_something(i32 noundef 9, i32 noundef 5)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 9, i32 noundef 5, i32 noundef %9) #3
  %11 = tail call i32 @doing_something(i32 noundef 10, i32 noundef 6)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 10, i32 noundef 6, i32 noundef %11) #3
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
