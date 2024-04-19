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
  %6 = mul nsw i32 %.tr, %accumulator.tr
  br label %tailrecurse

7:                                                ; preds = %3
  %accumulator.ret.tr = mul nsw i32 1, %accumulator.tr
  ret i32 %accumulator.ret.tr
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) #0 {
  %smax = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  %2 = add nuw i32 %smax, 1
  br label %3

3:                                                ; preds = %4, %1
  %.0 = phi i32 [ 1, %1 ], [ %5, %4 ]
  %storemerge = phi i32 [ 1, %1 ], [ %6, %4 ]
  %exitcond = icmp eq i32 %storemerge, %2
  br i1 %exitcond, label %7, label %4

4:                                                ; preds = %3
  %5 = mul nsw i32 %.0, %storemerge
  %6 = add nuw i32 %storemerge, 1
  br label %3, !llvm.loop !6

7:                                                ; preds = %3
  %.0.lcssa = phi i32 [ %.0, %3 ]
  ret i32 %.0.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) #0 {
  %smax = tail call i32 @llvm.smax.i32(i32 %1, i32 0)
  %smax2 = tail call i32 @llvm.smax.i32(i32 %0, i32 0)
  br label %3

3:                                                ; preds = %14, %2
  %.0 = phi i32 [ 0, %2 ], [ %.1.lcssa, %14 ]
  %storemerge = phi i32 [ 0, %2 ], [ %15, %14 ]
  %exitcond3 = icmp ne i32 %storemerge, %smax2
  br i1 %exitcond3, label %4, label %16

4:                                                ; preds = %3
  %5 = add nsw i32 %.0, %storemerge
  br label %6

6:                                                ; preds = %7, %4
  %.1 = phi i32 [ %5, %4 ], [ %12, %7 ]
  %storemerge1 = phi i32 [ 0, %4 ], [ %13, %7 ]
  %exitcond = icmp ne i32 %storemerge1, %smax
  br i1 %exitcond, label %7, label %14

7:                                                ; preds = %6
  %8 = sub nsw i32 %.1, %storemerge1
  %9 = tail call i32 @recursive_factorial(i32 noundef %storemerge)
  %10 = tail call i32 @normal_factorial(i32 noundef %storemerge1)
  %11 = sub nsw i32 %9, %10
  %12 = add nsw i32 %8, %11
  %13 = add nuw i32 %storemerge1, 1
  br label %6, !llvm.loop !8

14:                                               ; preds = %6
  %.1.lcssa = phi i32 [ %.1, %6 ]
  %15 = add nuw i32 %storemerge, 1
  br label %3, !llvm.loop !9

16:                                               ; preds = %3
  %.0.lcssa = phi i32 [ %.0, %3 ]
  ret i32 %.0.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %2
  br label %4

4:                                                ; preds = %3
  %5 = tail call i32 @doing_something(i32 noundef 1, i32 noundef 2)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 1, i32 noundef 2, i32 noundef %5) #4
  br label %7

7:                                                ; preds = %4
  %8 = tail call i32 @doing_something(i32 noundef 6, i32 noundef 3)
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 6, i32 noundef 3, i32 noundef %8) #4
  br label %10

10:                                               ; preds = %7
  %11 = tail call i32 @doing_something(i32 noundef 2, i32 noundef 4)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 2, i32 noundef 4, i32 noundef %11) #4
  br label %13

13:                                               ; preds = %10
  %14 = tail call i32 @doing_something(i32 noundef 9, i32 noundef 5)
  %15 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 9, i32 noundef 5, i32 noundef %14) #4
  br label %16

16:                                               ; preds = %13
  %17 = tail call i32 @doing_something(i32 noundef 10, i32 noundef 6)
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 10, i32 noundef 6, i32 noundef %17) #4
  br i1 false, label %19, label %22

19:                                               ; preds = %16
  %20 = tail call i32 @doing_something(i32 noundef poison, i32 noundef poison)
  %21 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef poison, i32 noundef poison, i32 noundef %20) #4
  unreachable

22:                                               ; preds = %16
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

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
