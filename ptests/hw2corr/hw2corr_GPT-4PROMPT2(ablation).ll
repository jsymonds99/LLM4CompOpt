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

3:                                                ; preds = %13, %2
  %.0 = phi i32 [ 1, %2 ], [ %14, %13 ]
  %4 = icmp slt i32 %.0, 10
  br i1 %4, label %5, label %15

5:                                                ; preds = %3
  %6 = load float, ptr %1, align 4
  %7 = fptosi float %6 to i32
  %8 = srem i32 %7, %.0
  %9 = load float, ptr %0, align 4
  %10 = mul nsw i32 %8, %.0
  %11 = sitofp i32 %10 to float
  %12 = fadd float %9, %11
  store float %12, ptr %0, align 4
  br label %13

13:                                               ; preds = %5
  %14 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

15:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store float 0.000000e+00, ptr %3, align 4
  br label %6

6:                                                ; preds = %32, %2
  %.031 = phi float [ undef, %2 ], [ %23, %32 ]
  %.030 = phi i64 [ 1, %2 ], [ %.1, %32 ]
  %.029 = phi i64 [ 1907, %2 ], [ %12, %32 ]
  %.028 = phi float [ undef, %2 ], [ %16, %32 ]
  %.027 = phi i64 [ 1, %2 ], [ %33, %32 ]
  %.0 = phi float [ 5.813000e+03, %2 ], [ %22, %32 ]
  %7 = icmp sle i64 %.027, 40000000
  br i1 %7, label %8, label %34

8:                                                ; preds = %6
  %9 = mul nsw i64 27611, %.029
  %10 = sdiv i64 %9, 74383
  %11 = mul nsw i64 74383, %10
  %12 = sub nsw i64 %9, %11
  %13 = sitofp i64 %12 to float
  %14 = fpext float %13 to double
  %15 = fdiv double %14, 7.438300e+04
  %16 = fptrunc double %15 to float
  %17 = fmul float 1.307000e+03, %.0
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
  br i1 %28, label %29, label %31

29:                                               ; preds = %8
  %30 = add nsw i64 %.030, 1
  br label %31

31:                                               ; preds = %29, %8
  %.1 = phi i64 [ %30, %29 ], [ %.030, %8 ]
  br label %32

32:                                               ; preds = %31
  %33 = add nsw i64 %.027, 1
  br label %6, !llvm.loop !8

34:                                               ; preds = %6
  %35 = fpext float %.028 to double
  %36 = fpext float %.031 to double
  %37 = trunc i64 %.030 to i32
  %38 = trunc i64 %.027 to i32
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %35, double noundef %36, i32 noundef %37, i32 noundef %38)
  %40 = sitofp i64 %.030 to float
  %41 = fpext float %40 to double
  %42 = fmul double 4.000000e+00, %41
  %43 = sitofp i64 40000000 to float
  %44 = fpext float %43 to double
  %45 = fdiv double %42, %44
  %46 = fptrunc double %45 to float
  %47 = fpext float %46 to double
  %48 = load float, ptr %3, align 4
  %49 = fpext float %48 to double
  %50 = fmul double %49, 0.000000e+00
  %51 = trunc i64 40000000 to i32
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %47, double noundef %50, i32 noundef %51)
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
