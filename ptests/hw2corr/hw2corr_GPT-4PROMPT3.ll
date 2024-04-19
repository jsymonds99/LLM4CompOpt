; ModuleID = 'hw2corr_unoptimized.ll'
source_filename = "hw2corr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @myadd(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %5, %2
  %.0 = phi i32 [ 1, %2 ], [ %13, %5 ]
  %4 = icmp slt i32 %.0, 10
  br i1 %4, label %5, label %14

5:                                                ; preds = %3
  %6 = load float, ptr %1, align 4
  %7 = fptosi float %6 to i32
  %8 = srem i32 %7, %.0
  %9 = load float, ptr %0, align 4
  %10 = mul nsw i32 %8, %.0
  %11 = sitofp i32 %10 to float
  %12 = fadd float %9, %11
  store float %12, ptr %0, align 4
  %13 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

14:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store float 0.000000e+00, ptr %3, align 4
  br label %6

6:                                                ; preds = %8, %2
  %.05 = phi float [ undef, %2 ], [ %16, %8 ]
  %.04 = phi float [ undef, %2 ], [ %23, %8 ]
  %.03 = phi float [ 5.813000e+03, %2 ], [ %22, %8 ]
  %.02 = phi i64 [ 1, %2 ], [ %.1, %8 ]
  %.01 = phi i64 [ 1907, %2 ], [ %12, %8 ]
  %.0 = phi i64 [ 1, %2 ], [ %30, %8 ]
  %7 = icmp sle i64 %.0, 40000000
  br i1 %7, label %8, label %31

8:                                                ; preds = %6
  %9 = mul nsw i64 27611, %.01
  %10 = sdiv i64 %9, 74383
  %11 = mul nsw i64 74383, %10
  %12 = sub nsw i64 %9, %11
  %13 = sitofp i64 %12 to float
  %14 = fpext float %13 to double
  %15 = fdiv double %14, 7.438300e+04
  %16 = fptrunc double %15 to float
  %17 = fmul float 1.307000e+03, %.03
  %18 = fdiv float %17, 5.471000e+03
  %19 = fptosi float %18 to i64
  %20 = sitofp i64 %19 to float
  %21 = fneg float 5.471000e+03
  %22 = call float @llvm.fmuladd.f32(float %21, float %20, float %17)
  %23 = fdiv float %22, 5.471000e+03
  %24 = fmul float %23, %23
  %25 = call float @llvm.fmuladd.f32(float %16, float %16, float %24)
  store float %25, ptr %4, align 4
  call void @myadd(ptr noundef %3, ptr noundef %4)
  %26 = load float, ptr %4, align 4
  %27 = fpext float %26 to double
  %28 = fcmp ole double %27, 1.000000e+00
  %29 = add nsw i64 %.02, 1
  %.1 = select i1 %28, i64 %29, i64 %.02
  %30 = add nsw i64 %.0, 1
  br label %6, !llvm.loop !8

31:                                               ; preds = %6
  %32 = fpext float %.05 to double
  %33 = fpext float %.04 to double
  %34 = trunc i64 %.02 to i32
  %35 = trunc i64 %.0 to i32
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %32, double noundef %33, i32 noundef %34, i32 noundef %35)
  %37 = sitofp i64 %.02 to float
  %38 = fpext float %37 to double
  %39 = fmul double 4.000000e+00, %38
  %40 = sitofp i64 40000000 to float
  %41 = fpext float %40 to double
  %42 = fdiv double %39, %41
  %43 = fptrunc double %42 to float
  %44 = fpext float %43 to double
  %45 = load float, ptr %3, align 4
  %46 = fpext float %45 to double
  %47 = fmul double %46, 0.000000e+00
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %44, double noundef %47, i32 noundef 40000000)
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
