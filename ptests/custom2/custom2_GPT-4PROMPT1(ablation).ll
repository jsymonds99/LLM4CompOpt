; ModuleID = 'custom2_unoptimized.ll'
source_filename = "custom2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"max %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @find_max(double noundef %0, double noundef %1, double noundef %2) #0 {
  br label %4

4:                                                ; preds = %14, %3
  %.01 = phi double [ -1.000000e+09, %3 ], [ %.1.1, %14 ]
  %.0 = phi i32 [ -10, %3 ], [ %21, %14 ]
  br label %5

5:                                                ; preds = %4
  %6 = sitofp i32 %.0 to double
  %7 = fmul double %6, %0
  %8 = fmul double %6, %1
  %9 = tail call double @llvm.fmuladd.f64(double %7, double %6, double %8)
  %10 = fadd double %9, %2
  %11 = fcmp ogt double %10, %.01
  %.1 = select i1 %11, double %10, double %.01
  %12 = add nuw nsw i32 %.0, 1
  %13 = icmp slt i32 %12, 11
  br i1 %13, label %14, label %22

14:                                               ; preds = %5
  %15 = sitofp i32 %12 to double
  %16 = fmul double %15, %0
  %17 = fmul double %15, %1
  %18 = tail call double @llvm.fmuladd.f64(double %16, double %15, double %17)
  %19 = fadd double %18, %2
  %20 = fcmp ogt double %19, %.1
  %.1.1 = select i1 %20, double %19, double %.1
  %21 = add nsw i32 %.0, 2
  br label %4, !llvm.loop !6

22:                                               ; preds = %5
  %.01.lcssa = phi double [ %.1, %5 ]
  ret double %.01.lcssa
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @find_min(double noundef %0, double noundef %1, double noundef %2) #0 {
  br label %4

4:                                                ; preds = %14, %3
  %.01 = phi double [ 1.000000e+09, %3 ], [ %.1.1, %14 ]
  %.0 = phi i32 [ -10, %3 ], [ %21, %14 ]
  br label %5

5:                                                ; preds = %4
  %6 = sitofp i32 %.0 to double
  %7 = fmul double %6, %0
  %8 = fmul double %6, %1
  %9 = tail call double @llvm.fmuladd.f64(double %7, double %6, double %8)
  %10 = fadd double %9, %2
  %11 = fcmp olt double %10, %.01
  %.1 = select i1 %11, double %10, double %.01
  %12 = add nuw nsw i32 %.0, 1
  %13 = icmp slt i32 %12, 11
  br i1 %13, label %14, label %22

14:                                               ; preds = %5
  %15 = sitofp i32 %12 to double
  %16 = fmul double %15, %0
  %17 = fmul double %15, %1
  %18 = tail call double @llvm.fmuladd.f64(double %16, double %15, double %17)
  %19 = fadd double %18, %2
  %20 = fcmp olt double %19, %.1
  %.1.1 = select i1 %20, double %19, double %.1
  %21 = add nsw i32 %.0, 2
  br label %4, !llvm.loop !8

22:                                               ; preds = %5
  %.01.lcssa = phi double [ %.1, %5 ]
  ret double %.01.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %33, %0
  %.06 = phi i32 [ 0, %0 ], [ %34, %33 ]
  %.02 = phi i32 [ 10, %0 ], [ %.24.lcssa, %33 ]
  %.01 = phi i32 [ 15, %0 ], [ %.2.lcssa, %33 ]
  %2 = icmp slt i32 %.06, %.01
  br i1 %2, label %3, label %35

3:                                                ; preds = %1
  %4 = and i32 %.06, 1
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %3
  %7 = add nsw i32 %.01, 2
  %8 = mul nsw i32 %.02, 3
  br label %12

9:                                                ; preds = %3
  %10 = add nsw i32 %.01, -1
  %11 = sdiv i32 %.02, 5
  br label %12

12:                                               ; preds = %9, %6
  %.13 = phi i32 [ %8, %6 ], [ %11, %9 ]
  %.1 = phi i32 [ %7, %6 ], [ %10, %9 ]
  br label %13

13:                                               ; preds = %24, %12
  %.24 = phi i32 [ %.13, %12 ], [ %.35, %24 ]
  %.2 = phi i32 [ %.1, %12 ], [ %.3, %24 ]
  %.0 = phi i32 [ 0, %12 ], [ %32, %24 ]
  %14 = icmp slt i32 %.0, %.24
  br i1 %14, label %15, label %33

15:                                               ; preds = %13
  %16 = and i32 %.0, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %15
  %19 = add nsw i32 %.2, 2
  %20 = mul nsw i32 %.24, 3
  br label %24

21:                                               ; preds = %15
  %22 = add nsw i32 %.2, -1
  %23 = sdiv i32 %.24, 5
  br label %24

24:                                               ; preds = %21, %18
  %.35 = phi i32 [ %20, %18 ], [ %23, %21 ]
  %.3 = phi i32 [ %19, %18 ], [ %22, %21 ]
  %25 = sitofp i32 %.0 to double
  %26 = sitofp i32 %.3 to double
  %27 = sitofp i32 %.35 to double
  %28 = tail call double @find_max(double noundef %25, double noundef %26, double noundef %27)
  %29 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %28) #3
  %30 = tail call double @find_min(double noundef %25, double noundef %26, double noundef %27)
  %31 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %30) #3
  %32 = add nuw nsw i32 %.0, 1
  br label %13, !llvm.loop !9

33:                                               ; preds = %13
  %.24.lcssa = phi i32 [ %.24, %13 ]
  %.2.lcssa = phi i32 [ %.2, %13 ]
  %34 = add nuw nsw i32 %.06, 1
  br label %1, !llvm.loop !10

35:                                               ; preds = %1
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
