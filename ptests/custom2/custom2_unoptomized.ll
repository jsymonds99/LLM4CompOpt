; ModuleID = 'custom2.c'
source_filename = "custom2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"max %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"min %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
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

10:                                               ; preds = %33, %3
  %11 = load i32, ptr %8, align 4
  %12 = icmp sle i32 %11, 10
  br i1 %12, label %13, label %36

13:                                               ; preds = %10
  %14 = load double, ptr %4, align 8
  %15 = load i32, ptr %8, align 4
  %16 = sitofp i32 %15 to double
  %17 = fmul double %14, %16
  %18 = load i32, ptr %8, align 4
  %19 = sitofp i32 %18 to double
  %20 = load double, ptr %5, align 8
  %21 = load i32, ptr %8, align 4
  %22 = sitofp i32 %21 to double
  %23 = fmul double %20, %22
  %24 = call double @llvm.fmuladd.f64(double %17, double %19, double %23)
  %25 = load double, ptr %6, align 8
  %26 = fadd double %24, %25
  store double %26, ptr %9, align 8
  %27 = load double, ptr %9, align 8
  %28 = load double, ptr %7, align 8
  %29 = fcmp ogt double %27, %28
  br i1 %29, label %30, label %32

30:                                               ; preds = %13
  %31 = load double, ptr %9, align 8
  store double %31, ptr %7, align 8
  br label %32

32:                                               ; preds = %30, %13
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %8, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %8, align 4
  br label %10, !llvm.loop !6

36:                                               ; preds = %10
  %37 = load double, ptr %7, align 8
  ret double %37
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind optnone uwtable
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

10:                                               ; preds = %33, %3
  %11 = load i32, ptr %8, align 4
  %12 = icmp sle i32 %11, 10
  br i1 %12, label %13, label %36

13:                                               ; preds = %10
  %14 = load double, ptr %4, align 8
  %15 = load i32, ptr %8, align 4
  %16 = sitofp i32 %15 to double
  %17 = fmul double %14, %16
  %18 = load i32, ptr %8, align 4
  %19 = sitofp i32 %18 to double
  %20 = load double, ptr %5, align 8
  %21 = load i32, ptr %8, align 4
  %22 = sitofp i32 %21 to double
  %23 = fmul double %20, %22
  %24 = call double @llvm.fmuladd.f64(double %17, double %19, double %23)
  %25 = load double, ptr %6, align 8
  %26 = fadd double %24, %25
  store double %26, ptr %9, align 8
  %27 = load double, ptr %9, align 8
  %28 = load double, ptr %7, align 8
  %29 = fcmp olt double %27, %28
  br i1 %29, label %30, label %32

30:                                               ; preds = %13
  %31 = load double, ptr %9, align 8
  store double %31, ptr %7, align 8
  br label %32

32:                                               ; preds = %30, %13
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %8, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %8, align 4
  br label %10, !llvm.loop !8

36:                                               ; preds = %10
  %37 = load double, ptr %7, align 8
  ret double %37
}

; Function Attrs: noinline nounwind optnone uwtable
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

6:                                                ; preds = %64, %0
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %67

10:                                               ; preds = %6
  %11 = load i32, ptr %4, align 4
  %12 = srem i32 %11, 2
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %10
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, 2
  store i32 %16, ptr %2, align 4
  %17 = load i32, ptr %3, align 4
  %18 = mul nsw i32 %17, 3
  store i32 %18, ptr %3, align 4
  br label %24

19:                                               ; preds = %10
  %20 = load i32, ptr %2, align 4
  %21 = sub nsw i32 %20, 1
  store i32 %21, ptr %2, align 4
  %22 = load i32, ptr %3, align 4
  %23 = sdiv i32 %22, 5
  store i32 %23, ptr %3, align 4
  br label %24

24:                                               ; preds = %19, %14
  store i32 0, ptr %5, align 4
  br label %25

25:                                               ; preds = %60, %24
  %26 = load i32, ptr %5, align 4
  %27 = load i32, ptr %3, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %63

29:                                               ; preds = %25
  %30 = load i32, ptr %5, align 4
  %31 = srem i32 %30, 2
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %38

33:                                               ; preds = %29
  %34 = load i32, ptr %2, align 4
  %35 = add nsw i32 %34, 2
  store i32 %35, ptr %2, align 4
  %36 = load i32, ptr %3, align 4
  %37 = mul nsw i32 %36, 3
  store i32 %37, ptr %3, align 4
  br label %43

38:                                               ; preds = %29
  %39 = load i32, ptr %2, align 4
  %40 = sub nsw i32 %39, 1
  store i32 %40, ptr %2, align 4
  %41 = load i32, ptr %3, align 4
  %42 = sdiv i32 %41, 5
  store i32 %42, ptr %3, align 4
  br label %43

43:                                               ; preds = %38, %33
  %44 = load i32, ptr %5, align 4
  %45 = sitofp i32 %44 to double
  %46 = load i32, ptr %2, align 4
  %47 = sitofp i32 %46 to double
  %48 = load i32, ptr %3, align 4
  %49 = sitofp i32 %48 to double
  %50 = call double @find_max(double noundef %45, double noundef %47, double noundef %49)
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %50)
  %52 = load i32, ptr %5, align 4
  %53 = sitofp i32 %52 to double
  %54 = load i32, ptr %2, align 4
  %55 = sitofp i32 %54 to double
  %56 = load i32, ptr %3, align 4
  %57 = sitofp i32 %56 to double
  %58 = call double @find_min(double noundef %53, double noundef %55, double noundef %57)
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %58)
  br label %60

60:                                               ; preds = %43
  %61 = load i32, ptr %5, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %5, align 4
  br label %25, !llvm.loop !9

63:                                               ; preds = %25
  br label %64

64:                                               ; preds = %63
  %65 = load i32, ptr %4, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %4, align 4
  br label %6, !llvm.loop !10

67:                                               ; preds = %6
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
