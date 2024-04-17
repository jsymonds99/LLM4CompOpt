; ModuleID = 'custom2_unoptimized.ll'
source_filename = "custom2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"max %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local double @find_max(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %12, %3
  %.011 = phi i32 [ -10, %3 ], [ %19, %12 ]
  %.0 = phi double [ -1.000000e+09, %3 ], [ %.1.1, %12 ]
  %5 = sitofp i32 %.011 to double
  %6 = fmul double %5, %0
  %7 = fmul double %5, %1
  %8 = tail call double @llvm.fmuladd.f64(double %6, double %5, double %7)
  %9 = fadd double %8, %2
  %10 = fcmp ogt double %9, %.0
  %.1 = select i1 %10, double %9, double %.0
  %11 = or i32 %.011, 1
  %exitcond.not.1 = icmp eq i32 %11, 11
  br i1 %exitcond.not.1, label %20, label %12

12:                                               ; preds = %4
  %13 = sitofp i32 %11 to double
  %14 = fmul double %13, %0
  %15 = fmul double %13, %1
  %16 = tail call double @llvm.fmuladd.f64(double %14, double %13, double %15)
  %17 = fadd double %16, %2
  %18 = fcmp ogt double %17, %.1
  %.1.1 = select i1 %18, double %17, double %.1
  %19 = add nsw i32 %.011, 2
  br label %4, !llvm.loop !6

20:                                               ; preds = %4
  ret double %.1
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local double @find_min(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %12, %3
  %.011 = phi i32 [ -10, %3 ], [ %19, %12 ]
  %.0 = phi double [ 1.000000e+09, %3 ], [ %.1.1, %12 ]
  %5 = sitofp i32 %.011 to double
  %6 = fmul double %5, %0
  %7 = fmul double %5, %1
  %8 = tail call double @llvm.fmuladd.f64(double %6, double %5, double %7)
  %9 = fadd double %8, %2
  %10 = fcmp olt double %9, %.0
  %.1 = select i1 %10, double %9, double %.0
  %11 = or i32 %.011, 1
  %exitcond.not.1 = icmp eq i32 %11, 11
  br i1 %exitcond.not.1, label %20, label %12

12:                                               ; preds = %4
  %13 = sitofp i32 %11 to double
  %14 = fmul double %13, %0
  %15 = fmul double %13, %1
  %16 = tail call double @llvm.fmuladd.f64(double %14, double %13, double %15)
  %17 = fadd double %16, %2
  %18 = fcmp olt double %17, %.1
  %.1.1 = select i1 %18, double %17, double %.1
  %19 = add nsw i32 %.011, 2
  br label %4, !llvm.loop !8

20:                                               ; preds = %4
  ret double %.1
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %32, %0
  %.024 = phi i32 [ 15, %0 ], [ %.226, %32 ]
  %.023 = phi i32 [ 10, %0 ], [ %.2, %32 ]
  %.022 = phi i32 [ 0, %0 ], [ %33, %32 ]
  %2 = icmp slt i32 %.022, %.024
  br i1 %2, label %3, label %34

3:                                                ; preds = %1
  %4 = and i32 %.022, 1
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %3
  %7 = add nsw i32 %.024, 2
  %8 = mul nsw i32 %.023, 3
  br label %.preheader

9:                                                ; preds = %3
  %10 = add nsw i32 %.024, -1
  %11 = sdiv i32 %.023, 5
  br label %.preheader

.preheader:                                       ; preds = %9, %6
  %.226.ph = phi i32 [ %10, %9 ], [ %7, %6 ]
  %.2.ph = phi i32 [ %11, %9 ], [ %8, %6 ]
  br label %12

12:                                               ; preds = %.preheader, %23
  %.226 = phi i32 [ %.327, %23 ], [ %.226.ph, %.preheader ]
  %.2 = phi i32 [ %.3, %23 ], [ %.2.ph, %.preheader ]
  %.0 = phi i32 [ %31, %23 ], [ 0, %.preheader ]
  %13 = icmp slt i32 %.0, %.2
  br i1 %13, label %14, label %32

14:                                               ; preds = %12
  %15 = and i32 %.0, 1
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %14
  %18 = add nsw i32 %.226, 2
  %19 = mul nsw i32 %.2, 3
  br label %23

20:                                               ; preds = %14
  %21 = add nsw i32 %.226, -1
  %22 = sdiv i32 %.2, 5
  br label %23

23:                                               ; preds = %20, %17
  %.327 = phi i32 [ %18, %17 ], [ %21, %20 ]
  %.3 = phi i32 [ %19, %17 ], [ %22, %20 ]
  %24 = sitofp i32 %.0 to double
  %25 = sitofp i32 %.327 to double
  %26 = sitofp i32 %.3 to double
  %27 = tail call double @find_max(double noundef %24, double noundef %25, double noundef %26)
  %28 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %27)
  %29 = tail call double @find_min(double noundef %24, double noundef %25, double noundef %26)
  %30 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %29)
  %31 = add nuw nsw i32 %.0, 1
  br label %12, !llvm.loop !9

32:                                               ; preds = %12
  %33 = add nuw nsw i32 %.022, 1
  br label %1, !llvm.loop !10

34:                                               ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

attributes #0 = { nofree noinline nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
