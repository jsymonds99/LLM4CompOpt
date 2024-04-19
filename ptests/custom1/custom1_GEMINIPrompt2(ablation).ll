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

tailrecurse:                                      ; preds = %4, %1
  %accumulator.tr = phi i32 [ 1, %1 ], [ %6, %4 ]
  %.tr = phi i32 [ %0, %1 ], [ %5, %4 ]
  %2 = icmp eq i32 %.tr, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %tailrecurse
  br label %7

4:                                                ; preds = %tailrecurse
  %5 = add nsw i32 %.tr, -1
  %6 = mul nsw i32 %accumulator.tr, %.tr
  br label %tailrecurse

7:                                                ; preds = %3
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
  %.01.lcssa = phi i32 [ %.01, %2 ]
  ret i32 %.01.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %16, %2
  %.02 = phi i32 [ 0, %2 ], [ %.1.lcssa, %16 ]
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
  %10 = sub nsw i32 %.1, %.0
  %11 = tail call i32 @recursive_factorial(i32 noundef %.01)
  %12 = tail call i32 @normal_factorial(i32 noundef %.0)
  %13 = sub nsw i32 %11, %12
  %14 = add nsw i32 %10, %13
  %15 = add nuw nsw i32 %.0, 1
  br label %7, !llvm.loop !8

16:                                               ; preds = %7
  %.1.lcssa = phi i32 [ %.1, %7 ]
  %17 = add nuw nsw i32 %.01, 1
  br label %3, !llvm.loop !9

18:                                               ; preds = %3
  %.02.lcssa = phi i32 [ %.02, %3 ]
  ret i32 %.02.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %2
  br label %4

4:                                                ; preds = %3
  %5 = tail call i32 @doing_something(i32 noundef 1, i32 noundef 2)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1, i32 noundef 2, i32 noundef %5) #3
  br label %7

7:                                                ; preds = %4
  %8 = tail call i32 @doing_something(i32 noundef 6, i32 noundef 3)
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 6, i32 noundef 3, i32 noundef %8) #3
  br label %10

10:                                               ; preds = %7
  %11 = tail call i32 @doing_something(i32 noundef 2, i32 noundef 4)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 2, i32 noundef 4, i32 noundef %11) #3
  br label %13

13:                                               ; preds = %10
  %14 = tail call i32 @doing_something(i32 noundef 9, i32 noundef 5)
  %15 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 9, i32 noundef 5, i32 noundef %14) #3
  br label %16

16:                                               ; preds = %13
  %17 = tail call i32 @doing_something(i32 noundef 10, i32 noundef 6)
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 10, i32 noundef 6, i32 noundef %17) #3
  br i1 false, label %19, label %22

19:                                               ; preds = %16
  %20 = tail call i32 @doing_something(i32 noundef poison, i32 noundef poison)
  %21 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef poison, i32 noundef poison, i32 noundef %20) #3
  unreachable

22:                                               ; preds = %16
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
