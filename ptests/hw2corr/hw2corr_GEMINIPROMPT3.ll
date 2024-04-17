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
  br label %3

3:                                                ; preds = %2, %3
  %.01 = phi i32 [ 1, %2 ], [ %11, %3 ]
  %4 = load float, ptr %1, align 4
  %5 = fptosi float %4 to i32
  %6 = srem i32 %5, %.01
  %7 = load float, ptr %0, align 4
  %8 = mul nsw i32 %6, %.01
  %9 = sitofp i32 %8 to float
  %10 = fadd float %7, %9
  store float %10, ptr %0, align 4
  %11 = add nuw nsw i32 %.01, 1
  %12 = icmp ult i32 %11, 10
  br i1 %12, label %3, label %13, !llvm.loop !6

13:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %3, align 4
  br label %5

5:                                                ; preds = %2, %22
  %.09 = phi i64 [ 1, %2 ], [ %23, %22 ]
  %.018 = phi i64 [ 1907, %2 ], [ %7, %22 ]
  %.027 = phi i64 [ 1, %2 ], [ %.1, %22 ]
  %.036 = phi float [ 5.813000e+03, %2 ], [ %14, %22 ]
  %6 = mul nuw nsw i64 %.018, 27611
  %7 = urem i64 %6, 74383
  %8 = sitofp i64 %7 to float
  %9 = fdiv float %8, 7.438300e+04
  %10 = fmul float %.036, 1.307000e+03
  %11 = fdiv float %10, 5.471000e+03
  %12 = fptosi float %11 to i64
  %13 = sitofp i64 %12 to float
  %14 = call float @llvm.fmuladd.f32(float %13, float -5.471000e+03, float %10)
  %15 = fdiv float %14, 5.471000e+03
  %16 = fmul float %15, %15
  %17 = call float @llvm.fmuladd.f32(float %9, float %9, float %16)
  store float %17, ptr %4, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %4)
  %18 = load float, ptr %4, align 4
  %19 = fcmp ugt float %18, 1.000000e+00
  br i1 %19, label %22, label %20

20:                                               ; preds = %5
  %21 = add nsw i64 %.027, 1
  br label %22

22:                                               ; preds = %20, %5
  %.1 = phi i64 [ %21, %20 ], [ %.027, %5 ]
  %23 = add nuw nsw i64 %.09, 1
  %24 = icmp ult i64 %23, 40000001
  br i1 %24, label %5, label %25, !llvm.loop !8

25:                                               ; preds = %22
  %.05.lcssa = phi float [ %9, %22 ]
  %.04.lcssa = phi float [ %15, %22 ]
  %.02.lcssa = phi i64 [ %.1, %22 ]
  %.0.lcssa = phi i64 [ %23, %22 ]
  %26 = fpext float %.05.lcssa to double
  %27 = fpext float %.04.lcssa to double
  %28 = trunc i64 %.02.lcssa to i32
  %29 = trunc i64 %.0.lcssa to i32
  %30 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %26, double noundef %27, i32 noundef %28, i32 noundef %29) #4
  %31 = sitofp i64 %.02.lcssa to float
  %32 = fpext float %31 to double
  %33 = fmul double %32, 4.000000e+00
  %34 = fdiv double %33, 4.000000e+07
  %35 = fptrunc double %34 to float
  %36 = fpext float %35 to double
  %37 = load float, ptr %3, align 4
  %38 = fpext float %37 to double
  %39 = fmul double %38, 0.000000e+00
  %40 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %36, double noundef %39, i32 noundef 40000000) #4
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
