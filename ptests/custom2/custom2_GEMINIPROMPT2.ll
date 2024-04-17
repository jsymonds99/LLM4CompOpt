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

10:                                               ; preds = %22, %3
  %11 = phi double [ %23, %22 ], [ -1.000000e+09, %3 ]
  %12 = phi i32 [ %24, %22 ], [ -10, %3 ]
  %13 = icmp sle i32 %12, 10
  br i1 %13, label %14, label %25

14:                                               ; preds = %10
  %15 = sitofp i32 %12 to double
  %16 = fmul double %0, %15
  %17 = fmul double %1, %15
  %18 = call double @llvm.fmuladd.f64(double %16, double %15, double %17)
  %19 = fadd double %18, %2
  store double %19, ptr %9, align 8
  %20 = fcmp ogt double %19, %11
  br i1 %20, label %21, label %22

21:                                               ; preds = %14
  store double %19, ptr %7, align 8
  br label %22

22:                                               ; preds = %21, %14
  %23 = phi double [ %19, %21 ], [ %11, %14 ]
  %24 = add nsw i32 %12, 1
  store i32 %24, ptr %8, align 4
  br label %10, !llvm.loop !6

25:                                               ; preds = %10
  ret double %11
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

10:                                               ; preds = %22, %3
  %11 = phi double [ %23, %22 ], [ 1.000000e+09, %3 ]
  %12 = phi i32 [ %24, %22 ], [ -10, %3 ]
  %13 = icmp sle i32 %12, 10
  br i1 %13, label %14, label %25

14:                                               ; preds = %10
  %15 = sitofp i32 %12 to double
  %16 = fmul double %0, %15
  %17 = fmul double %1, %15
  %18 = call double @llvm.fmuladd.f64(double %16, double %15, double %17)
  %19 = fadd double %18, %2
  store double %19, ptr %9, align 8
  %20 = fcmp olt double %19, %11
  br i1 %20, label %21, label %22

21:                                               ; preds = %14
  store double %19, ptr %7, align 8
  br label %22

22:                                               ; preds = %21, %14
  %23 = phi double [ %19, %21 ], [ %11, %14 ]
  %24 = add nsw i32 %12, 1
  store i32 %24, ptr %8, align 4
  br label %10, !llvm.loop !8

25:                                               ; preds = %10
  ret double %11
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

6:                                                ; preds = %48, %0
  %7 = phi i32 [ %24, %48 ], [ 10, %0 ]
  %8 = phi i32 [ %26, %48 ], [ 15, %0 ]
  %9 = phi i32 [ %49, %48 ], [ 0, %0 ]
  %10 = icmp slt i32 %9, %8
  br i1 %10, label %11, label %50

11:                                               ; preds = %6
  %12 = srem i32 %9, 2
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = add nsw i32 %8, 2
  store i32 %15, ptr %2, align 4
  %16 = mul nsw i32 %7, 3
  store i32 %16, ptr %3, align 4
  br label %20

17:                                               ; preds = %11
  %18 = sub nsw i32 %8, 1
  store i32 %18, ptr %2, align 4
  %19 = sdiv i32 %7, 5
  store i32 %19, ptr %3, align 4
  br label %20

20:                                               ; preds = %17, %14
  %21 = phi i32 [ %19, %17 ], [ %16, %14 ]
  %22 = phi i32 [ %18, %17 ], [ %15, %14 ]
  store i32 0, ptr %5, align 4
  br label %23

23:                                               ; preds = %37, %20
  %24 = phi i32 [ %38, %37 ], [ %21, %20 ]
  %25 = phi i32 [ %47, %37 ], [ 0, %20 ]
  %26 = phi i32 [ %39, %37 ], [ %22, %20 ]
  %27 = icmp slt i32 %25, %24
  br i1 %27, label %28, label %48

28:                                               ; preds = %23
  %29 = srem i32 %25, 2
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %34

31:                                               ; preds = %28
  %32 = add nsw i32 %26, 2
  store i32 %32, ptr %2, align 4
  %33 = mul nsw i32 %24, 3
  store i32 %33, ptr %3, align 4
  br label %37

34:                                               ; preds = %28
  %35 = sub nsw i32 %26, 1
  store i32 %35, ptr %2, align 4
  %36 = sdiv i32 %24, 5
  store i32 %36, ptr %3, align 4
  br label %37

37:                                               ; preds = %34, %31
  %38 = phi i32 [ %36, %34 ], [ %33, %31 ]
  %39 = phi i32 [ %35, %34 ], [ %32, %31 ]
  %40 = sitofp i32 %25 to double
  %41 = sitofp i32 %39 to double
  %42 = sitofp i32 %38 to double
  %43 = call double @find_max(double noundef %40, double noundef %41, double noundef %42)
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %43)
  %45 = call double @find_min(double noundef %40, double noundef %41, double noundef %42)
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %45)
  %47 = add nsw i32 %25, 1
  store i32 %47, ptr %5, align 4
  br label %23, !llvm.loop !9

48:                                               ; preds = %23
  %49 = add nsw i32 %9, 1
  store i32 %49, ptr %4, align 4
  br label %6, !llvm.loop !10

50:                                               ; preds = %6
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
