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
  br i1 true, label %.lr.ph, label %._crit_edge1

._crit_edge1:                                     ; preds = %2
  br label %52

.lr.ph:                                           ; preds = %2
  %.pre = load float, ptr %0, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph
  %3 = fadd float %.pre, 0.000000e+00
  store float %3, ptr %0, align 4
  %4 = load float, ptr %1, align 4
  %5 = fptosi float %4 to i32
  %6 = srem i32 %5, 2
  %7 = mul nsw i32 %6, 2
  %8 = sitofp i32 %7 to float
  %9 = fadd float %3, %8
  store float %9, ptr %0, align 4
  %10 = load float, ptr %1, align 4
  %11 = fptosi float %10 to i32
  %12 = srem i32 %11, 3
  %13 = mul nsw i32 %12, 3
  %14 = sitofp i32 %13 to float
  %15 = fadd float %9, %14
  store float %15, ptr %0, align 4
  %16 = load float, ptr %1, align 4
  %17 = fptosi float %16 to i32
  %18 = srem i32 %17, 4
  %19 = mul nsw i32 %18, 4
  %20 = sitofp i32 %19 to float
  %21 = fadd float %15, %20
  store float %21, ptr %0, align 4
  %22 = load float, ptr %1, align 4
  %23 = fptosi float %22 to i32
  %24 = srem i32 %23, 5
  %25 = mul nsw i32 %24, 5
  %26 = sitofp i32 %25 to float
  %27 = fadd float %21, %26
  store float %27, ptr %0, align 4
  %28 = load float, ptr %1, align 4
  %29 = fptosi float %28 to i32
  %30 = srem i32 %29, 6
  %31 = mul nsw i32 %30, 6
  %32 = sitofp i32 %31 to float
  %33 = fadd float %27, %32
  store float %33, ptr %0, align 4
  %34 = load float, ptr %1, align 4
  %35 = fptosi float %34 to i32
  %36 = srem i32 %35, 7
  %37 = mul nsw i32 %36, 7
  %38 = sitofp i32 %37 to float
  %39 = fadd float %33, %38
  store float %39, ptr %0, align 4
  %40 = load float, ptr %1, align 4
  %41 = fptosi float %40 to i32
  %42 = srem i32 %41, 8
  %43 = mul nsw i32 %42, 8
  %44 = sitofp i32 %43 to float
  %45 = fadd float %39, %44
  store float %45, ptr %0, align 4
  %46 = load float, ptr %1, align 4
  %47 = fptosi float %46 to i32
  %48 = srem i32 %47, 9
  %49 = mul nsw i32 %48, 9
  %50 = sitofp i32 %49 to float
  %51 = fadd float %45, %50
  store float %51, ptr %0, align 4
  br label %52

52:                                               ; preds = %._crit_edge1, %._crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %3, align 4
  br i1 true, label %.lr.ph, label %._crit_edge1

._crit_edge1:                                     ; preds = %2
  br label %33

.lr.ph:                                           ; preds = %2
  br label %5

5:                                                ; preds = %.lr.ph, %26
  %6 = phi i64 [ 1, %.lr.ph ], [ %28, %26 ]
  %7 = phi i64 [ 1, %.lr.ph ], [ %27, %26 ]
  %8 = phi float [ 5.813000e+03, %.lr.ph ], [ %18, %26 ]
  %9 = phi i64 [ 1907, %.lr.ph ], [ %11, %26 ]
  %10 = mul nsw i64 %9, 27611
  %11 = srem i64 %10, 74383
  %12 = sitofp i64 %11 to float
  %13 = fdiv float %12, 7.438300e+04
  %14 = fmul float %8, 1.307000e+03
  %15 = fdiv float %14, 5.471000e+03
  %16 = fptosi float %15 to i64
  %17 = sitofp i64 %16 to float
  %18 = call float @llvm.fmuladd.f32(float %17, float -5.471000e+03, float %14)
  %19 = fdiv float %18, 5.471000e+03
  %20 = fmul float %19, %19
  %21 = call float @llvm.fmuladd.f32(float %13, float %13, float %20)
  store float %21, ptr %4, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %4)
  %22 = load float, ptr %4, align 4
  %23 = fcmp ugt float %22, 1.000000e+00
  br i1 %23, label %26, label %24

24:                                               ; preds = %5
  %25 = add nsw i64 %7, 1
  br label %26

26:                                               ; preds = %24, %5
  %27 = phi i64 [ %25, %24 ], [ %7, %5 ]
  %28 = add nuw nsw i64 %6, 1
  %29 = icmp ult i64 %6, 40000000
  br i1 %29, label %5, label %._crit_edge, !llvm.loop !6

._crit_edge:                                      ; preds = %26
  %.lcssa5 = phi i64 [ %27, %26 ]
  %.lcssa4 = phi i64 [ %28, %26 ]
  %.lcssa3 = phi float [ %13, %26 ]
  %.lcssa = phi float [ %19, %26 ]
  %30 = fpext float %.lcssa3 to double
  %31 = fpext float %.lcssa to double
  %32 = trunc i64 %.lcssa4 to i32
  br label %33

33:                                               ; preds = %._crit_edge1, %._crit_edge
  %34 = phi i32 [ poison, %._crit_edge1 ], [ %32, %._crit_edge ]
  %35 = phi i64 [ poison, %._crit_edge1 ], [ %.lcssa5, %._crit_edge ]
  %36 = phi double [ poison, %._crit_edge1 ], [ %31, %._crit_edge ]
  %37 = phi double [ poison, %._crit_edge1 ], [ %30, %._crit_edge ]
  %38 = trunc i64 %35 to i32
  %39 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %37, double noundef %36, i32 noundef %38, i32 noundef %34) #4
  %40 = sitofp i64 %35 to float
  %41 = fpext float %40 to double
  %42 = fmul double %41, 4.000000e+00
  %43 = fdiv double %42, 4.000000e+07
  %44 = fptrunc double %43 to float
  %45 = fpext float %44 to double
  %46 = load float, ptr %3, align 4
  %47 = fpext float %46 to double
  %48 = fmul double %47, 0.000000e+00
  %49 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %45, double noundef %48, i32 noundef 40000000) #4
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
