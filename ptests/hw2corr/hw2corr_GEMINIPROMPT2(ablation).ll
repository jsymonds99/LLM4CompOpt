; ModuleID = 'hw2corr_unoptimized.ll'
source_filename = "hw2corr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @myadd(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 1, ptr %5, align 4
  br label %8

8:                                                ; preds = %26, %2
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %9, 10
  br i1 %10, label %11, label %29

11:                                               ; preds = %8
  %12 = load ptr, ptr %4, align 8
  %13 = load float, ptr %12, align 4
  %14 = fptosi float %13 to i32
  store i32 %14, ptr %6, align 4
  %15 = load i32, ptr %6, align 4
  %16 = load i32, ptr %5, align 4
  %17 = srem i32 %15, %16
  store i32 %17, ptr %7, align 4
  %18 = load ptr, ptr %3, align 8
  %19 = load float, ptr %18, align 4
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %5, align 4
  %22 = mul nsw i32 %20, %21
  %23 = sitofp i32 %22 to float
  %24 = fadd float %19, %23
  %25 = load ptr, ptr %3, align 8
  store float %24, ptr %25, align 4
  br label %26

26:                                               ; preds = %11
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %5, align 4
  br label %8, !llvm.loop !6

29:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store float 0.000000e+00, ptr %6, align 4
  store i64 1, ptr %15, align 8
  store i64 1907, ptr %16, align 8
  store float 5.813000e+03, ptr %7, align 4
  store float 1.307000e+03, ptr %8, align 4
  store float 5.471000e+03, ptr %9, align 4
  store i64 40000000, ptr %17, align 8
  store i64 1, ptr %18, align 8
  br label %21

21:                                               ; preds = %66, %2
  %22 = load i64, ptr %18, align 8
  %23 = load i64, ptr %17, align 8
  %24 = icmp sle i64 %22, %23
  br i1 %24, label %25, label %69

25:                                               ; preds = %21
  %26 = load i64, ptr %16, align 8
  %27 = mul nsw i64 27611, %26
  store i64 %27, ptr %19, align 8
  %28 = load i64, ptr %19, align 8
  %29 = load i64, ptr %19, align 8
  %30 = sdiv i64 %29, 74383
  %31 = mul nsw i64 74383, %30
  %32 = sub nsw i64 %28, %31
  store i64 %32, ptr %16, align 8
  %33 = load i64, ptr %16, align 8
  %34 = sitofp i64 %33 to float
  %35 = fpext float %34 to double
  %36 = fdiv double %35, 7.438300e+04
  %37 = fptrunc double %36 to float
  store float %37, ptr %10, align 4
  %38 = load float, ptr %8, align 4
  %39 = load float, ptr %7, align 4
  %40 = fmul float %38, %39
  store float %40, ptr %14, align 4
  %41 = load float, ptr %14, align 4
  %42 = load float, ptr %9, align 4
  %43 = load float, ptr %14, align 4
  %44 = load float, ptr %9, align 4
  %45 = fdiv float %43, %44
  %46 = fptosi float %45 to i64
  %47 = sitofp i64 %46 to float
  %48 = fneg float %42
  %49 = call float @llvm.fmuladd.f32(float %48, float %47, float %41)
  store float %49, ptr %7, align 4
  %50 = load float, ptr %7, align 4
  %51 = load float, ptr %9, align 4
  %52 = fdiv float %50, %51
  store float %52, ptr %11, align 4
  %53 = load float, ptr %10, align 4
  %54 = load float, ptr %10, align 4
  %55 = load float, ptr %11, align 4
  %56 = load float, ptr %11, align 4
  %57 = fmul float %55, %56
  %58 = call float @llvm.fmuladd.f32(float %53, float %54, float %57)
  store float %58, ptr %12, align 4
  call void @myadd(ptr noundef %6, ptr noundef %12)
  %59 = load float, ptr %12, align 4
  %60 = fpext float %59 to double
  %61 = fcmp ole double %60, 1.000000e+00
  br i1 %61, label %62, label %65

62:                                               ; preds = %25
  %63 = load i64, ptr %15, align 8
  %64 = add nsw i64 %63, 1
  store i64 %64, ptr %15, align 8
  br label %65

65:                                               ; preds = %62, %25
  br label %66

66:                                               ; preds = %65
  %67 = load i64, ptr %18, align 8
  %68 = add nsw i64 %67, 1
  store i64 %68, ptr %18, align 8
  br label %21, !llvm.loop !8

69:                                               ; preds = %21
  %70 = load float, ptr %10, align 4
  %71 = fpext float %70 to double
  %72 = load float, ptr %11, align 4
  %73 = fpext float %72 to double
  %74 = load i64, ptr %15, align 8
  %75 = trunc i64 %74 to i32
  %76 = load i64, ptr %18, align 8
  %77 = trunc i64 %76 to i32
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %71, double noundef %73, i32 noundef %75, i32 noundef %77)
  %79 = load i64, ptr %15, align 8
  %80 = sitofp i64 %79 to float
  %81 = fpext float %80 to double
  %82 = fmul double 4.000000e+00, %81
  %83 = load i64, ptr %17, align 8
  %84 = sitofp i64 %83 to float
  %85 = fpext float %84 to double
  %86 = fdiv double %82, %85
  %87 = fptrunc double %86 to float
  store float %87, ptr %13, align 4
  %88 = load float, ptr %13, align 4
  %89 = fpext float %88 to double
  %90 = load float, ptr %6, align 4
  %91 = fpext float %90 to double
  %92 = fmul double %91, 0.000000e+00
  %93 = load i64, ptr %17, align 8
  %94 = trunc i64 %93 to i32
  %95 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %89, double noundef %92, i32 noundef %94)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
