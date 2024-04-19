; ModuleID = 'pi_unoptimized.ll'
source_filename = "pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

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
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %3, align 4
  br label %5

5:                                                ; preds = %25, %2
  %.05 = phi float [ undef, %2 ], [ %11, %25 ]
  %.04 = phi float [ undef, %2 ], [ %17, %25 ]
  %.03 = phi float [ 5.813000e+03, %2 ], [ %16, %25 ]
  %.02 = phi i64 [ 1, %2 ], [ %.1, %25 ]
  %.01 = phi i64 [ 1907, %2 ], [ %9, %25 ]
  %.0 = phi i64 [ 1, %2 ], [ %26, %25 ]
  %6 = icmp ult i64 %.0, 40000001
  br i1 %6, label %7, label %27

7:                                                ; preds = %5
  %8 = mul nsw i64 %.01, 27611
  %9 = srem i64 %8, 74383
  %10 = sitofp i64 %9 to float
  %11 = fdiv float %10, 7.438300e+04
  %12 = fmul float %.03, 1.307000e+03
  %13 = fdiv float %12, 5.471000e+03
  %14 = fptosi float %13 to i64
  %15 = sitofp i64 %14 to float
  %16 = call float @llvm.fmuladd.f32(float %15, float -5.471000e+03, float %12)
  %17 = fdiv float %16, 5.471000e+03
  %18 = fmul float %17, %17
  %19 = call float @llvm.fmuladd.f32(float %11, float %11, float %18)
  store float %19, ptr %4, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %4)
  %20 = load float, ptr %4, align 4
  %21 = fcmp ugt float %20, 1.000000e+00
  br i1 %21, label %24, label %22

22:                                               ; preds = %7
  %23 = add nsw i64 %.02, 1
  br label %24

24:                                               ; preds = %22, %7
  %.1 = phi i64 [ %23, %22 ], [ %.02, %7 ]
  br label %25

25:                                               ; preds = %24
  %26 = add nuw nsw i64 %.0, 1
  br label %5, !llvm.loop !6

27:                                               ; preds = %5
  %28 = fpext float %.05 to double
  %29 = fpext float %.04 to double
  %30 = trunc i64 %.02 to i32
  %31 = trunc i64 %.0 to i32
  %32 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %28, double noundef %29, i32 noundef %30, i32 noundef %31) #4
  %33 = sitofp i64 %.02 to float
  %34 = fpext float %33 to double
  %35 = fmul double %34, 4.000000e+00
  %36 = fdiv double %35, 4.000000e+07
  %37 = fptrunc double %36 to float
  %38 = fpext float %37 to double
  %39 = load float, ptr %3, align 4
  %40 = fpext float %39 to double
  %41 = fmul double %40, 0.000000e+00
  %42 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %38, double noundef %41, i32 noundef 40000000) #4
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
