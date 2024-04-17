; ModuleID = 'hw2corr_unoptimized.ll'
source_filename = "hw2corr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @myadd(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) #0 {
.lr.ph:
  br label %2

2:                                                ; preds = %.lr.ph, %2
  %.0 = phi i32 [ 1, %.lr.ph ], [ %10, %2 ]
  %3 = load float, ptr %1, align 4
  %4 = fptosi float %3 to i32
  %5 = srem i32 %4, %.0
  %6 = load float, ptr %0, align 4
  %7 = mul nsw i32 %5, %.0
  %8 = sitofp i32 %7 to float
  %9 = fadd float %6, %8
  store float %9, ptr %0, align 4
  %10 = add nsw i32 %.0, 1
  %11 = icmp slt i32 %.0, 9
  br i1 %11, label %2, label %._crit_edge, !llvm.loop !6

._crit_edge:                                      ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) #1 {
.lr.ph:
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %2, align 4
  br label %4

4:                                                ; preds = %.lr.ph, %22
  %.04 = phi i64 [ 1, %.lr.ph ], [ %.1, %22 ]
  %.03 = phi i64 [ 1907, %.lr.ph ], [ %6, %22 ]
  %.02 = phi i64 [ 1, %.lr.ph ], [ %23, %22 ]
  %.0 = phi float [ 5.813000e+03, %.lr.ph ], [ %14, %22 ]
  %.fr1 = freeze i64 %.03
  %5 = mul i64 %.fr1, 27611
  %6 = srem i64 %5, 74383
  %7 = sitofp i64 %6 to float
  %8 = fdiv float %7, 7.438300e+04
  %9 = fmul float 1.307000e+03, %.0
  %10 = fdiv float %9, 5.471000e+03
  %11 = fptosi float %10 to i64
  %12 = sitofp i64 %11 to float
  %13 = fneg float 5.471000e+03
  %14 = call float @llvm.fmuladd.f32(float %13, float %12, float %9)
  %15 = fdiv float %14, 5.471000e+03
  %16 = fmul float %15, %15
  %17 = call float @llvm.fmuladd.f32(float %8, float %8, float %16)
  store float %17, ptr %3, align 4
  call void @myadd(ptr noundef nonnull %2, ptr noundef nonnull %3)
  %18 = load float, ptr %3, align 4
  %19 = fcmp ugt float %18, 1.000000e+00
  br i1 %19, label %22, label %20

20:                                               ; preds = %4
  %21 = add nsw i64 %.04, 1
  br label %22

22:                                               ; preds = %4, %20
  %.1 = phi i64 [ %.04, %4 ], [ %21, %20 ]
  %23 = add nsw i64 %.02, 1
  %.not.not = icmp slt i64 %.02, 40000000
  br i1 %.not.not, label %4, label %._crit_edge, !llvm.loop !8

._crit_edge:                                      ; preds = %22
  %24 = fpext float %8 to double
  %25 = fpext float %15 to double
  %26 = trunc i64 %.1 to i32
  %27 = trunc i64 %23 to i32
  %28 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %24, double noundef %25, i32 noundef %26, i32 noundef %27) #5
  %29 = sitofp i64 %.1 to float
  %30 = fpext float %29 to double
  %31 = fmul double %30, 4.000000e+00
  %32 = sitofp i64 40000000 to float
  %33 = fpext float %32 to double
  %34 = fdiv double %31, %33
  %35 = fptrunc double %34 to float
  %36 = fpext float %35 to double
  %37 = load float, ptr %2, align 4
  %38 = fpext float %37 to double
  %39 = fmul double %38, 0.000000e+00
  %40 = trunc i64 40000000 to i32
  %41 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %36, double noundef %39, i32 noundef %40) #5
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #4

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind }

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
