; ModuleID = 'custom2_unoptimized.ll'
source_filename = "custom2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"max %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @find_max(double noundef %0, double noundef %1, double noundef %2) #0 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  store double %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store double %2, ptr %6, align 8
  store double -1.000000e+09, ptr %7, align 8
  store i32 -10, ptr %8, align 4
  br label %10

10:                                               ; preds = %3, %20
  %11 = phi i32 [ -10, %3 ], [ %22, %20 ]
  %12 = phi double [ -1.000000e+09, %3 ], [ %21, %20 ]
  %13 = sitofp i32 %11 to double
  %14 = fmul double %0, %13
  %15 = fmul double %1, %13
  %16 = call double @llvm.fmuladd.f64(double %14, double %13, double %15)
  %17 = fadd double %16, %2
  store double %17, ptr %9, align 8
  %18 = fcmp ogt double %17, %12
  br i1 %18, label %19, label %20

19:                                               ; preds = %10
  store double %17, ptr %7, align 8
  br label %20

20:                                               ; preds = %10, %19
  %21 = phi double [ %12, %10 ], [ %17, %19 ]
  %22 = add nsw i32 %11, 1
  store i32 %22, ptr %8, align 4
  %exitcond = icmp ne i32 %22, 11
  br i1 %exitcond, label %10, label %23, !llvm.loop !6

23:                                               ; preds = %20
  %.lcssa = phi double [ %21, %20 ]
  ret double %.lcssa
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @find_min(double noundef %0, double noundef %1, double noundef %2) #0 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  store double %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store double %2, ptr %6, align 8
  store double 1.000000e+09, ptr %7, align 8
  store i32 -10, ptr %8, align 4
  br label %10

10:                                               ; preds = %3, %20
  %11 = phi i32 [ -10, %3 ], [ %22, %20 ]
  %12 = phi double [ 1.000000e+09, %3 ], [ %21, %20 ]
  %13 = sitofp i32 %11 to double
  %14 = fmul double %0, %13
  %15 = fmul double %1, %13
  %16 = call double @llvm.fmuladd.f64(double %14, double %13, double %15)
  %17 = fadd double %16, %2
  store double %17, ptr %9, align 8
  %18 = fcmp olt double %17, %12
  br i1 %18, label %19, label %20

19:                                               ; preds = %10
  store double %17, ptr %7, align 8
  br label %20

20:                                               ; preds = %10, %19
  %21 = phi double [ %12, %10 ], [ %17, %19 ]
  %22 = add nsw i32 %11, 1
  store i32 %22, ptr %8, align 4
  %exitcond = icmp ne i32 %22, 11
  br i1 %exitcond, label %10, label %23, !llvm.loop !8

23:                                               ; preds = %20
  %.lcssa = phi double [ %21, %20 ]
  ret double %.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 15, ptr %2, align 4
  store i32 10, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %0, %._crit_edge
  %7 = phi i32 [ 0, %0 ], [ %44, %._crit_edge ]
  %8 = phi i32 [ 15, %0 ], [ %.lcssa, %._crit_edge ]
  %9 = phi i32 [ 10, %0 ], [ %.lcssa1, %._crit_edge ]
  %.urem2 = urem i32 %7, 2
  %10 = icmp eq i32 %.urem2, 0
  br i1 %10, label %11, label %14

11:                                               ; preds = %6
  %12 = add nsw i32 %8, 2
  store i32 %12, ptr %2, align 4
  %13 = mul nsw i32 %9, 3
  store i32 %13, ptr %3, align 4
  br label %17

14:                                               ; preds = %6
  %15 = sub nuw nsw i32 %8, 1
  store i32 %15, ptr %2, align 4
  %16 = sdiv i32 %9, 5
  store i32 %16, ptr %3, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = phi i32 [ %16, %14 ], [ %13, %11 ]
  %19 = phi i32 [ %15, %14 ], [ %12, %11 ]
  store i32 0, ptr %5, align 4
  %20 = icmp slt i32 0, %18
  br i1 %20, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %17
  br label %21

21:                                               ; preds = %.lr.ph, %32
  %22 = phi i32 [ %19, %.lr.ph ], [ %34, %32 ]
  %23 = phi i32 [ 0, %.lr.ph ], [ %42, %32 ]
  %24 = phi i32 [ %18, %.lr.ph ], [ %33, %32 ]
  %.urem = urem i32 %23, 2
  %25 = icmp eq i32 %.urem, 0
  br i1 %25, label %26, label %29

26:                                               ; preds = %21
  %27 = add nsw i32 %22, 2
  store i32 %27, ptr %2, align 4
  %28 = mul nsw i32 %24, 3
  store i32 %28, ptr %3, align 4
  br label %32

29:                                               ; preds = %21
  %30 = sub nsw i32 %22, 1
  store i32 %30, ptr %2, align 4
  %31 = sdiv i32 %24, 5
  store i32 %31, ptr %3, align 4
  br label %32

32:                                               ; preds = %29, %26
  %33 = phi i32 [ %31, %29 ], [ %28, %26 ]
  %34 = phi i32 [ %30, %29 ], [ %27, %26 ]
  %35 = sitofp i32 %23 to double
  %36 = sitofp i32 %34 to double
  %37 = sitofp i32 %33 to double
  %38 = call double @find_max(double noundef %35, double noundef %36, double noundef %37)
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %38)
  %40 = call double @find_min(double noundef %35, double noundef %36, double noundef %37)
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %40)
  %42 = add nuw nsw i32 %23, 1
  store i32 %42, ptr %5, align 4
  %43 = icmp slt i32 %42, %33
  br i1 %43, label %21, label %._crit_edge, !llvm.loop !9

._crit_edge:                                      ; preds = %32, %17
  %.lcssa1 = phi i32 [ %18, %17 ], [ %33, %32 ]
  %.lcssa = phi i32 [ %19, %17 ], [ %34, %32 ]
  %44 = add nuw nsw i32 %7, 1
  store i32 %44, ptr %4, align 4
  %45 = icmp slt i32 %44, %.lcssa
  br i1 %45, label %6, label %46, !llvm.loop !10

46:                                               ; preds = %._crit_edge
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
