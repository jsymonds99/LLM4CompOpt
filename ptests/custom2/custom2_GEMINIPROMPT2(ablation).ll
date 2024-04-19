; ModuleID = 'custom2_unoptimized.ll'
source_filename = "custom2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"max %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @find_max(double noundef %0, double noundef %1, double noundef %2) #0 {
  br label %4

4:                                                ; preds = %16, %3
  %.01 = phi double [ -1.000000e+09, %3 ], [ %.1, %16 ]
  %IV.S. = phi double [ -1.000000e+01, %3 ], [ %IV.S.next., %16 ]
  %.0 = phi i32 [ -10, %3 ], [ %17, %16 ]
  %5 = icmp slt i32 %.0, 11
  br i1 %5, label %6, label %18

6:                                                ; preds = %4
  %7 = sitofp i32 %.0 to double
  %8 = fmul double %7, %0
  %9 = sitofp i32 %.0 to double
  %10 = fmul double %IV.S., %1
  %11 = call double @llvm.fmuladd.f64(double %8, double %9, double %10)
  %12 = fadd double %11, %2
  %13 = fcmp ogt double %12, %.01
  br i1 %13, label %14, label %15

14:                                               ; preds = %6
  br label %15

15:                                               ; preds = %14, %6
  %.1 = phi double [ %12, %14 ], [ %.01, %6 ]
  br label %16

16:                                               ; preds = %15
  %IV.S.next. = fadd double %IV.S., 1.000000e+00
  %17 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

18:                                               ; preds = %4
  %.01.lcssa = phi double [ %.01, %4 ]
  ret double %.01.lcssa
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @find_min(double noundef %0, double noundef %1, double noundef %2) #0 {
  br label %4

4:                                                ; preds = %16, %3
  %.01 = phi double [ 1.000000e+09, %3 ], [ %.1, %16 ]
  %IV.S. = phi double [ -1.000000e+01, %3 ], [ %IV.S.next., %16 ]
  %.0 = phi i32 [ -10, %3 ], [ %17, %16 ]
  %5 = icmp slt i32 %.0, 11
  br i1 %5, label %6, label %18

6:                                                ; preds = %4
  %7 = sitofp i32 %.0 to double
  %8 = fmul double %7, %0
  %9 = sitofp i32 %.0 to double
  %10 = fmul double %IV.S., %1
  %11 = call double @llvm.fmuladd.f64(double %8, double %9, double %10)
  %12 = fadd double %11, %2
  %13 = fcmp olt double %12, %.01
  br i1 %13, label %14, label %15

14:                                               ; preds = %6
  br label %15

15:                                               ; preds = %14, %6
  %.1 = phi double [ %12, %14 ], [ %.01, %6 ]
  br label %16

16:                                               ; preds = %15
  %IV.S.next. = fadd double %IV.S., 1.000000e+00
  %17 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !8

18:                                               ; preds = %4
  %.01.lcssa = phi double [ %.01, %4 ]
  ret double %.01.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %38, %0
  %.06 = phi i32 [ 0, %0 ], [ %39, %38 ]
  %.02 = phi i32 [ 10, %0 ], [ %.24.lcssa, %38 ]
  %.01 = phi i32 [ 15, %0 ], [ %.2.lcssa, %38 ]
  %2 = icmp slt i32 %.06, %.01
  br i1 %2, label %3, label %40

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

13:                                               ; preds = %35, %12
  %.24 = phi i32 [ %.13, %12 ], [ %.35, %35 ]
  %.2 = phi i32 [ %.1, %12 ], [ %.3, %35 ]
  %.0 = phi i32 [ 0, %12 ], [ %36, %35 ]
  %14 = icmp slt i32 %.0, %.24
  br i1 %14, label %15, label %37

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
  %28 = call double @find_max(double noundef %25, double noundef %26, double noundef %27)
  %29 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %28) #3
  %30 = sitofp i32 %.0 to double
  %31 = sitofp i32 %.3 to double
  %32 = sitofp i32 %.35 to double
  %33 = call double @find_min(double noundef %30, double noundef %31, double noundef %32)
  %34 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %33) #3
  br label %35

35:                                               ; preds = %24
  %36 = add nuw nsw i32 %.0, 1
  br label %13, !llvm.loop !9

37:                                               ; preds = %13
  %.24.lcssa = phi i32 [ %.24, %13 ]
  %.2.lcssa = phi i32 [ %.2, %13 ]
  br label %38

38:                                               ; preds = %37
  %39 = add nuw nsw i32 %.06, 1
  br label %1, !llvm.loop !10

40:                                               ; preds = %1
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
