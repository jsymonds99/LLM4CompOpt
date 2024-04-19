; ModuleID = 'pi_unoptimized.ll'
source_filename = "pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @myadd(ptr noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = load float, ptr %0, align 4
  %4 = load float, ptr %1, align 4
  %5 = fadd float %3, %4
  store float %5, ptr %0, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %3, align 4
  br label %5

5:                                                ; preds = %23, %2
  %.018 = phi float [ undef, %2 ], [ %16, %23 ]
  %.017 = phi i64 [ 1, %2 ], [ %.1, %23 ]
  %.016 = phi i64 [ 1907, %2 ], [ %8, %23 ]
  %.015 = phi float [ undef, %2 ], [ %10, %23 ]
  %.0 = phi float [ 5.813000e+03, %2 ], [ %15, %23 ]
  %storemerge = phi i64 [ 1, %2 ], [ %24, %23 ]
  %.not = icmp sgt i64 %storemerge, 40000000
  br i1 %.not, label %25, label %6

6:                                                ; preds = %5
  %7 = mul i64 %.016, 27611
  %8 = srem i64 %7, 74383
  %9 = sitofp i64 %8 to float
  %10 = fdiv float %9, 7.438300e+04
  %11 = fmul float %.0, 1.307000e+03
  %12 = fdiv float %11, 5.471000e+03
  %13 = fptosi float %12 to i64
  %14 = sitofp i64 %13 to float
  %15 = call float @llvm.fmuladd.f32(float -5.471000e+03, float %14, float %11)
  %16 = fdiv float %15, 5.471000e+03
  %17 = fmul float %16, %16
  %18 = call float @llvm.fmuladd.f32(float %10, float %10, float %17)
  store float %18, ptr %4, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %4)
  %19 = load float, ptr %4, align 4
  %20 = fcmp ugt float %19, 1.000000e+00
  br i1 %20, label %23, label %21

21:                                               ; preds = %6
  %22 = add nsw i64 %.017, 1
  br label %23

23:                                               ; preds = %6, %21
  %.1 = phi i64 [ %.017, %6 ], [ %22, %21 ]
  %24 = add nsw i64 %storemerge, 1
  br label %5, !llvm.loop !6

25:                                               ; preds = %5
  %26 = fpext float %.015 to double
  %27 = fpext float %.018 to double
  %28 = trunc i64 %.017 to i32
  %29 = trunc i64 %storemerge to i32
  %30 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %26, double noundef %27, i32 noundef %28, i32 noundef %29) #4
  %31 = sitofp i64 %.017 to float
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

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #3

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
