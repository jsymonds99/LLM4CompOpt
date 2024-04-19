; ModuleID = 'hw2corr_unoptimized.ll'
source_filename = "hw2corr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @myadd(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  br label %6

6:                                                ; preds = %9, %2
  %7 = phi i32 [ 1, %2 ], [ %17, %9 ]
  store i32 %7, ptr %5, align 4
  %8 = icmp slt i32 %7, 10
  br i1 %8, label %9, label %18

9:                                                ; preds = %6
  %10 = load float, ptr %1, align 4
  %11 = fptosi float %10 to i32
  %12 = srem i32 %11, %7
  %13 = load float, ptr %0, align 4
  %14 = mul nsw i32 %12, %7
  %15 = sitofp i32 %14 to float
  %16 = fadd float %13, %15
  store float %16, ptr %0, align 4
  %17 = add nsw i32 %7, 1
  br label %6, !llvm.loop !6

18:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %3, align 4
  store i64 1, ptr %10, align 8
  store i64 1907, ptr %11, align 8
  store float 5.813000e+03, ptr %4, align 4
  store float 1.307000e+03, ptr %5, align 4
  store float 5.471000e+03, ptr %6, align 4
  store i64 40000000, ptr %12, align 8
  br label %14

14:                                               ; preds = %38, %2
  %15 = phi float [ undef, %2 ], [ %31, %38 ]
  %16 = phi float [ undef, %2 ], [ %25, %38 ]
  %17 = phi i64 [ 1, %2 ], [ %39, %38 ]
  %18 = phi float [ 5.813000e+03, %2 ], [ %30, %38 ]
  %19 = phi i64 [ 1907, %2 ], [ %23, %38 ]
  %20 = phi i64 [ 1, %2 ], [ %40, %38 ]
  store i64 %20, ptr %13, align 8
  %.not = icmp sgt i64 %20, 40000000
  br i1 %.not, label %41, label %21

21:                                               ; preds = %14
  %22 = mul i64 %19, 27611
  %23 = srem i64 %22, 74383
  store i64 %23, ptr %11, align 8
  %24 = sitofp i64 %23 to float
  %25 = fdiv float %24, 7.438300e+04
  store float %25, ptr %7, align 4
  %26 = fmul float 1.307000e+03, %18
  %27 = fdiv float %26, 5.471000e+03
  %28 = fptosi float %27 to i64
  %29 = sitofp i64 %28 to float
  %30 = call float @llvm.fmuladd.f32(float -5.471000e+03, float %29, float %26)
  store float %30, ptr %4, align 4
  %31 = fdiv float %30, 5.471000e+03
  store float %31, ptr %8, align 4
  %32 = fmul float %31, %31
  %33 = call float @llvm.fmuladd.f32(float %25, float %25, float %32)
  store float %33, ptr %9, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %9)
  %34 = load float, ptr %9, align 4
  %35 = fcmp ugt float %34, 1.000000e+00
  br i1 %35, label %38, label %36

36:                                               ; preds = %21
  %37 = add nsw i64 %17, 1
  store i64 %37, ptr %10, align 8
  br label %38

38:                                               ; preds = %36, %21
  %39 = phi i64 [ %37, %36 ], [ %17, %21 ]
  %40 = add nsw i64 %20, 1
  br label %14, !llvm.loop !8

41:                                               ; preds = %14
  %.lcssa4 = phi float [ %15, %14 ]
  %.lcssa3 = phi float [ %16, %14 ]
  %.lcssa2 = phi i64 [ %17, %14 ]
  %.lcssa = phi i64 [ %20, %14 ]
  %42 = fpext float %.lcssa3 to double
  %43 = fpext float %.lcssa4 to double
  %44 = trunc i64 %.lcssa2 to i32
  %45 = trunc i64 %.lcssa to i32
  %46 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %42, double noundef %43, i32 noundef %44, i32 noundef %45) #4
  %47 = sitofp i64 %.lcssa2 to float
  %48 = fpext float %47 to double
  %49 = fmul double %48, 4.000000e+00
  %50 = fdiv double %49, 4.000000e+07
  %51 = fptrunc double %50 to float
  %52 = fpext float %51 to double
  %53 = load float, ptr %3, align 4
  %54 = fpext float %53 to double
  %55 = fmul double %54, 0.000000e+00
  %56 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %52, double noundef %55, i32 noundef 40000000) #4
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

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
