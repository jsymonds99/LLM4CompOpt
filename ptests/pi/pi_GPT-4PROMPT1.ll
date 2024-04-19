; ModuleID = 'pi_unoptimized.ll'
source_filename = "pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @myadd(ptr noundef %0, ptr noundef %1) #0 {
  %3 = load float, ptr %0, align 4
  %4 = load float, ptr %1, align 4
  %5 = fadd float %3, %4
  store float %5, ptr %0, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store float 0.000000e+00, ptr %3, align 4
  br label %6

6:                                                ; preds = %36, %2
  %7 = phi float [ %27, %36 ], [ 5.813000e+03, %2 ]
  %8 = phi i64 [ %18, %36 ], [ 1907, %2 ]
  %9 = phi i64 [ %37, %36 ], [ 1, %2 ]
  %10 = phi float [ %28, %36 ], [ undef, %2 ]
  %11 = phi float [ %22, %36 ], [ undef, %2 ]
  %12 = phi i64 [ %38, %36 ], [ 1, %2 ]
  %13 = icmp sle i64 %12, 40000000
  br i1 %13, label %14, label %39

14:                                               ; preds = %6
  %15 = mul nsw i64 27611, %8
  %16 = sdiv i64 %15, 74383
  %17 = mul nsw i64 74383, %16
  %18 = sub nsw i64 %15, %17
  %19 = sitofp i64 %18 to float
  %20 = fpext float %19 to double
  %21 = fdiv double %20, 7.438300e+04
  %22 = fptrunc double %21 to float
  %23 = fmul float 1.307000e+03, %7
  %24 = fdiv float %23, 5.471000e+03
  %25 = fptosi float %24 to i64
  %26 = sitofp i64 %25 to float
  %27 = call float @llvm.fmuladd.f32(float -5.471000e+03, float %26, float %23)
  %28 = fdiv float %27, 5.471000e+03
  %29 = fmul float %28, %28
  %30 = call float @llvm.fmuladd.f32(float %22, float %22, float %29)
  store float %30, ptr %4, align 4
  call void @myadd(ptr noundef %3, ptr noundef %4)
  %31 = load float, ptr %4, align 4
  %32 = fpext float %31 to double
  %33 = fcmp ole double %32, 1.000000e+00
  br i1 %33, label %34, label %36

34:                                               ; preds = %14
  %35 = add nsw i64 %9, 1
  br label %36

36:                                               ; preds = %34, %14
  %37 = phi i64 [ %35, %34 ], [ %9, %14 ]
  %38 = add nsw i64 %12, 1
  br label %6, !llvm.loop !6

39:                                               ; preds = %6
  %.lcssa3 = phi i64 [ %9, %6 ]
  %.lcssa2 = phi float [ %10, %6 ]
  %.lcssa1 = phi float [ %11, %6 ]
  %.lcssa = phi i64 [ %12, %6 ]
  %40 = fpext float %.lcssa1 to double
  %41 = fpext float %.lcssa2 to double
  %42 = trunc i64 %.lcssa3 to i32
  %43 = trunc i64 %.lcssa to i32
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %40, double noundef %41, i32 noundef %42, i32 noundef %43)
  %45 = sitofp i64 %.lcssa3 to float
  %46 = fpext float %45 to double
  %47 = fmul double 4.000000e+00, %46
  %48 = fdiv double %47, 4.000000e+07
  %49 = fptrunc double %48 to float
  %50 = fpext float %49 to double
  %51 = load float, ptr %3, align 4
  %52 = fpext float %51 to double
  %53 = fmul double %52, 0.000000e+00
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %50, double noundef %53, i32 noundef 40000000)
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
