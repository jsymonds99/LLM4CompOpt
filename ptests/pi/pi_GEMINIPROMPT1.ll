; ModuleID = 'pi_unoptimized.ll'
source_filename = "pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@1 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@2 = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @myadd(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load float, ptr %0, align 4
  %4 = load float, ptr %1, align 4
  %5 = fadd float %3, %4
  store float %5, ptr %0, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #1 {
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
  %14 = call i32 @puts(ptr nonnull dereferenceable(1) @2)
  store float 0.000000e+00, ptr %3, align 4
  store i64 1, ptr %10, align 8
  store i64 1907, ptr %11, align 8
  store float 5.813000e+03, ptr %4, align 4
  store float 1.307000e+03, ptr %5, align 4
  store float 5.471000e+03, ptr %6, align 4
  store i64 40000000, ptr %12, align 8
  br label %15

15:                                               ; preds = %38, %2
  %16 = phi float [ undef, %2 ], [ %32, %38 ]
  %17 = phi float [ undef, %2 ], [ %26, %38 ]
  %18 = phi i64 [ 1, %2 ], [ %39, %38 ]
  %19 = phi float [ 5.813000e+03, %2 ], [ %31, %38 ]
  %20 = phi i64 [ 1907, %2 ], [ %24, %38 ]
  %21 = phi i64 [ 1, %2 ], [ %40, %38 ]
  store i64 %21, ptr %13, align 8
  %exitcond = icmp eq i64 %21, 40000001
  br i1 %exitcond, label %41, label %22

22:                                               ; preds = %15
  %23 = mul nuw nsw i64 %20, 27611
  %24 = urem i64 %23, 74383
  store i64 %24, ptr %11, align 8
  %25 = sitofp i64 %24 to float
  %26 = fdiv float %25, 7.438300e+04
  store float %26, ptr %7, align 4
  %27 = fmul float 1.307000e+03, %19
  %28 = fdiv float %27, 5.471000e+03
  %29 = fptosi float %28 to i64
  %30 = sitofp i64 %29 to float
  %31 = call float @llvm.fmuladd.f32(float -5.471000e+03, float %30, float %27)
  store float %31, ptr %4, align 4
  %32 = fdiv float %31, 5.471000e+03
  store float %32, ptr %8, align 4
  %33 = fmul float %32, %32
  %34 = call float @llvm.fmuladd.f32(float %26, float %26, float %33)
  store float %34, ptr %9, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %9)
  %35 = fcmp ugt float %34, 1.000000e+00
  br i1 %35, label %38, label %36

36:                                               ; preds = %22
  %37 = add nsw i64 %18, 1
  store i64 %37, ptr %10, align 8
  br label %38

38:                                               ; preds = %22, %36
  %39 = phi i64 [ %18, %22 ], [ %37, %36 ]
  %40 = add nuw nsw i64 %21, 1
  br label %15, !llvm.loop !6

41:                                               ; preds = %15
  %.lcssa4 = phi float [ %16, %15 ]
  %.lcssa3 = phi float [ %17, %15 ]
  %.lcssa2 = phi i64 [ %18, %15 ]
  %42 = fpext float %.lcssa3 to double
  %43 = fpext float %.lcssa4 to double
  %44 = trunc i64 %.lcssa2 to i32
  %45 = trunc i64 40000001 to i32
  %46 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, double noundef %42, double noundef %43, i32 noundef %44, i32 noundef %45) #5
  %47 = sitofp i64 %.lcssa2 to float
  %48 = fpext float %47 to double
  %49 = fmul double %48, 4.000000e+00
  %50 = fdiv double %49, 4.000000e+07
  %51 = fptrunc double %50 to float
  %52 = fpext float %51 to double
  %53 = load float, ptr %3, align 4
  %54 = fpext float %53 to double
  %55 = fmul double %54, 0.000000e+00
  %56 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @1, double noundef %52, double noundef %55, i32 noundef 40000000) #5
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #4

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
