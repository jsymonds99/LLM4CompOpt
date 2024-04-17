; ModuleID = 'pi_unoptimized.ll'
source_filename = "pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@1 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@2 = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

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
  %5 = call i32 @puts(ptr nonnull dereferenceable(1) @2)
  store float 0.000000e+00, ptr %3, align 4
  br label %6

6:                                                ; preds = %31, %2
  %7 = phi float [ undef, %2 ], [ %24, %31 ]
  %8 = phi float [ undef, %2 ], [ %18, %31 ]
  %9 = phi i64 [ 1, %2 ], [ %32, %31 ]
  %10 = phi float [ 5.813000e+03, %2 ], [ %23, %31 ]
  %11 = phi i64 [ 1907, %2 ], [ %16, %31 ]
  %12 = phi i64 [ 1, %2 ], [ %33, %31 ]
  %13 = icmp sgt i64 %12, 40000000
  br i1 %13, label %34, label %14

14:                                               ; preds = %6
  %15 = mul nuw nsw i64 %11, 27611
  %16 = urem i64 %15, 74383
  %17 = sitofp i64 %16 to float
  %18 = fdiv float %17, 7.438300e+04
  %19 = fmul float %10, 1.307000e+03
  %20 = fdiv float %19, 5.471000e+03
  %21 = fptosi float %20 to i64
  %22 = sitofp i64 %21 to float
  %23 = call float @llvm.fmuladd.f32(float -5.471000e+03, float %22, float %19)
  %24 = fdiv float %23, 5.471000e+03
  %25 = fmul float %24, %24
  %26 = call float @llvm.fmuladd.f32(float %18, float %18, float %25)
  store float %26, ptr %4, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %4)
  %27 = load float, ptr %4, align 4
  %28 = fcmp ugt float %27, 1.000000e+00
  br i1 %28, label %31, label %29

29:                                               ; preds = %14
  %30 = add nsw i64 %9, 1
  br label %31

31:                                               ; preds = %29, %14
  %32 = phi i64 [ %30, %29 ], [ %9, %14 ]
  %33 = add nsw i64 %12, 1
  br label %6, !llvm.loop !6

34:                                               ; preds = %6
  %35 = fpext float %8 to double
  %36 = fpext float %7 to double
  %37 = trunc i64 %9 to i32
  %38 = trunc i64 %12 to i32
  %39 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, double noundef %35, double noundef %36, i32 noundef %37, i32 noundef %38) #4
  %40 = sitofp i64 %9 to float
  %41 = fpext float %40 to double
  %42 = fmul double %41, 4.000000e+00
  %43 = fdiv double %42, 4.000000e+07
  %44 = fptrunc double %43 to float
  %45 = fpext float %44 to double
  %46 = load float, ptr %3, align 4
  %47 = fpext float %46 to double
  %48 = fmul double %47, 0.000000e+00
  %49 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @1, double noundef %45, double noundef %48, i32 noundef 40000000) #4
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
