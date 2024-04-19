; ModuleID = 'hw2corr_unoptimized.ll'
source_filename = "hw2corr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@1 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@2 = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @myadd(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %6, %2
  %4 = phi i32 [ 1, %2 ], [ %14, %6 ]
  %5 = icmp ne i32 %4, 10
  br i1 %5, label %6, label %15

6:                                                ; preds = %3
  %7 = load float, ptr %1, align 4
  %8 = fptosi float %7 to i32
  %9 = srem i32 %8, %4
  %10 = load float, ptr %0, align 4
  %11 = mul nsw i32 %9, %4
  %12 = sitofp i32 %11 to float
  %13 = fadd float %10, %12
  store float %13, ptr %0, align 4
  %14 = add nuw nsw i32 %4, 1
  br label %3, !llvm.loop !6

15:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) #1 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = call i32 @puts(ptr nonnull dereferenceable(1) @2)
  store float 0.000000e+00, ptr %3, align 4
  br label %6

6:                                                ; preds = %31, %2
  %7 = phi float [ undef, %2 ], [ %24, %31 ]
  %8 = phi i64 [ 1, %2 ], [ %32, %31 ]
  %9 = phi i64 [ 1907, %2 ], [ %16, %31 ]
  %10 = phi float [ undef, %2 ], [ %18, %31 ]
  %11 = phi float [ 5.813000e+03, %2 ], [ %23, %31 ]
  %12 = phi i64 [ 1, %2 ], [ %33, %31 ]
  %13 = icmp eq i64 %12, 40000001
  br i1 %13, label %34, label %14

14:                                               ; preds = %6
  %15 = mul nuw nsw i64 %9, 27611
  %16 = urem i64 %15, 74383
  %17 = sitofp i64 %16 to float
  %18 = fdiv float %17, 7.438300e+04
  %19 = fmul float %11, 1.307000e+03
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
  %30 = add nsw i64 %8, 1
  br label %31

31:                                               ; preds = %14, %29
  %32 = phi i64 [ %8, %14 ], [ %30, %29 ]
  %33 = add nuw nsw i64 %12, 1
  br label %6, !llvm.loop !8

34:                                               ; preds = %6
  %35 = phi float [ %7, %6 ]
  %36 = phi i64 [ %8, %6 ]
  %37 = phi float [ %10, %6 ]
  %38 = fpext float %37 to double
  %39 = fpext float %35 to double
  %40 = trunc i64 %36 to i32
  %41 = trunc i64 40000001 to i32
  %42 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, double noundef %38, double noundef %39, i32 noundef %40, i32 noundef %41) #5
  %43 = sitofp i64 %36 to float
  %44 = fpext float %43 to double
  %45 = fmul double %44, 4.000000e+00
  %46 = fdiv double %45, 4.000000e+07
  %47 = fptrunc double %46 to float
  %48 = fpext float %47 to double
  %49 = load float, ptr %3, align 4
  %50 = fpext float %49 to double
  %51 = fmul double %50, 0.000000e+00
  %52 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @1, double noundef %48, double noundef %51, i32 noundef 40000000) #5
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #4

attributes #0 = { nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
