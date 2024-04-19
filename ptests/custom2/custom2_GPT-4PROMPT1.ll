; ModuleID = 'custom2_unoptimized.ll'
source_filename = "custom2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"max %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @find_max(double noundef %0, double noundef %1, double noundef %2) #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %3
  br label %4

4:                                                ; preds = %.lr.ph, %15
  %.012 = phi i32 [ -10, %.lr.ph ], [ %16, %15 ]
  %.0 = phi double [ -1.000000e+09, %.lr.ph ], [ %.1, %15 ]
  %5 = sitofp i32 %.012 to double
  %6 = fmul double %5, %0
  %7 = sitofp i32 %.012 to double
  %8 = sitofp i32 %.012 to double
  %9 = fmul double %8, %1
  %10 = call double @llvm.fmuladd.f64(double %6, double %7, double %9)
  %11 = fadd double %10, %2
  %12 = fcmp ogt double %11, %.0
  br i1 %12, label %13, label %14

13:                                               ; preds = %4
  br label %14

14:                                               ; preds = %13, %4
  %.1 = phi double [ %11, %13 ], [ %.0, %4 ]
  br label %15

15:                                               ; preds = %14
  %16 = add nsw i32 %.012, 1
  %17 = icmp slt i32 %.012, 10
  br i1 %17, label %4, label %._crit_edge, !llvm.loop !6

._crit_edge:                                      ; preds = %15
  br label %18

18:                                               ; preds = %._crit_edge
  ret double %.1
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @find_min(double noundef %0, double noundef %1, double noundef %2) #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %3
  br label %4

4:                                                ; preds = %.lr.ph, %15
  %.012 = phi i32 [ -10, %.lr.ph ], [ %16, %15 ]
  %.0 = phi double [ 1.000000e+09, %.lr.ph ], [ %.1, %15 ]
  %5 = sitofp i32 %.012 to double
  %6 = fmul double %5, %0
  %7 = sitofp i32 %.012 to double
  %8 = sitofp i32 %.012 to double
  %9 = fmul double %8, %1
  %10 = call double @llvm.fmuladd.f64(double %6, double %7, double %9)
  %11 = fadd double %10, %2
  %12 = fcmp olt double %11, %.0
  br i1 %12, label %13, label %14

13:                                               ; preds = %4
  br label %14

14:                                               ; preds = %13, %4
  %.1 = phi double [ %11, %13 ], [ %.0, %4 ]
  br label %15

15:                                               ; preds = %14
  %16 = add nsw i32 %.012, 1
  %17 = icmp slt i32 %.012, 10
  br i1 %17, label %4, label %._crit_edge, !llvm.loop !8

._crit_edge:                                      ; preds = %15
  br label %18

18:                                               ; preds = %._crit_edge
  ret double %.1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %0
  br label %1

1:                                                ; preds = %.lr.ph2, %36
  %.031 = phi i32 [ 15, %.lr.ph2 ], [ %.435, %36 ]
  %.030 = phi i32 [ 10, %.lr.ph2 ], [ %.4, %36 ]
  %.029 = phi i32 [ 0, %.lr.ph2 ], [ %37, %36 ]
  %2 = and i32 %.029, 1
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %1
  %5 = add nsw i32 %.031, 2
  %6 = mul nsw i32 %.030, 3
  br label %10

7:                                                ; preds = %1
  %8 = add nsw i32 %.031, -1
  %9 = sdiv i32 %.030, 5
  br label %10

10:                                               ; preds = %7, %4
  %.132 = phi i32 [ %5, %4 ], [ %8, %7 ]
  %.1 = phi i32 [ %6, %4 ], [ %9, %7 ]
  %11 = icmp sgt i32 %.1, 0
  br i1 %11, label %.lr.ph, label %35

.lr.ph:                                           ; preds = %10
  br label %12

12:                                               ; preds = %.lr.ph, %32
  %.233 = phi i32 [ %.132, %.lr.ph ], [ %.334, %32 ]
  %.2 = phi i32 [ %.1, %.lr.ph ], [ %.3, %32 ]
  %.0 = phi i32 [ 0, %.lr.ph ], [ %33, %32 ]
  %13 = and i32 %.0, 1
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %18

15:                                               ; preds = %12
  %16 = add nsw i32 %.233, 2
  %17 = mul nsw i32 %.2, 3
  br label %21

18:                                               ; preds = %12
  %19 = add nsw i32 %.233, -1
  %20 = sdiv i32 %.2, 5
  br label %21

21:                                               ; preds = %18, %15
  %.334 = phi i32 [ %16, %15 ], [ %19, %18 ]
  %.3 = phi i32 [ %17, %15 ], [ %20, %18 ]
  %22 = sitofp i32 %.0 to double
  %23 = sitofp i32 %.334 to double
  %24 = sitofp i32 %.3 to double
  %25 = call double @find_max(double noundef %22, double noundef %23, double noundef %24)
  %26 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %25) #3
  %27 = sitofp i32 %.0 to double
  %28 = sitofp i32 %.334 to double
  %29 = sitofp i32 %.3 to double
  %30 = call double @find_min(double noundef %27, double noundef %28, double noundef %29)
  %31 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %30) #3
  br label %32

32:                                               ; preds = %21
  %33 = add nuw nsw i32 %.0, 1
  %34 = icmp slt i32 %33, %.3
  br i1 %34, label %12, label %._crit_edge, !llvm.loop !9

._crit_edge:                                      ; preds = %32
  br label %35

35:                                               ; preds = %._crit_edge, %10
  %.435 = phi i32 [ %.334, %._crit_edge ], [ %.132, %10 ]
  %.4 = phi i32 [ %.3, %._crit_edge ], [ %.1, %10 ]
  br label %36

36:                                               ; preds = %35
  %37 = add nuw nsw i32 %.029, 1
  %38 = icmp slt i32 %37, %.435
  br i1 %38, label %1, label %._crit_edge3, !llvm.loop !10

._crit_edge3:                                     ; preds = %36
  br label %39

39:                                               ; preds = %._crit_edge3
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
!10 = distinct !{!10, !7}
