; ModuleID = 'hw2corr_unoptimized.ll'
source_filename = "hw2corr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @myadd(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %6, %2
  %4 = phi i32 [ %14, %6 ], [ 1, %2 ]
  %5 = icmp ult i32 %4, 10
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
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #1 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %3, align 4
  br label %5

5:                                                ; preds = %13, %2
  %6 = phi float [ %22, %13 ], [ 5.813000e+03, %2 ]
  %7 = phi i64 [ %15, %13 ], [ 1907, %2 ]
  %8 = phi i64 [ %29, %13 ], [ 1, %2 ]
  %9 = phi float [ %23, %13 ], [ undef, %2 ]
  %10 = phi float [ %17, %13 ], [ undef, %2 ]
  %11 = phi i64 [ %30, %13 ], [ 1, %2 ]
  %12 = icmp ult i64 %11, 40000001
  br i1 %12, label %13, label %31

13:                                               ; preds = %5
  %14 = mul nsw i64 %7, 27611
  %15 = srem i64 %14, 74383
  %16 = sitofp i64 %15 to float
  %17 = fdiv float %16, 7.438300e+04
  %18 = fmul float %6, 1.307000e+03
  %19 = fdiv float %18, 5.471000e+03
  %20 = fptosi float %19 to i64
  %21 = sitofp i64 %20 to float
  %22 = call float @llvm.fmuladd.f32(float %21, float -5.471000e+03, float %18)
  %23 = fdiv float %22, 5.471000e+03
  %24 = fmul float %23, %23
  %25 = call float @llvm.fmuladd.f32(float %17, float %17, float %24)
  store float %25, ptr %4, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %4)
  %26 = load float, ptr %4, align 4
  %27 = fcmp ugt float %26, 1.000000e+00
  %28 = add nsw i64 %8, 1
  %29 = select i1 %27, i64 %8, i64 %28
  %30 = add nuw nsw i64 %11, 1
  br label %5, !llvm.loop !8

31:                                               ; preds = %5
  %32 = fpext float %10 to double
  %33 = fpext float %9 to double
  %34 = trunc i64 %8 to i32
  %35 = trunc i64 %11 to i32
  %36 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %32, double noundef %33, i32 noundef %34, i32 noundef %35) #5
  %37 = sitofp i64 %8 to float
  %38 = fpext float %37 to double
  %39 = fmul double %38, 4.000000e+00
  %40 = fdiv double %39, 4.000000e+07
  %41 = fptrunc double %40 to float
  %42 = fpext float %41 to double
  %43 = load float, ptr %3, align 4
  %44 = fpext float %43 to double
  %45 = fmul double %44, 0.000000e+00
  %46 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %42, double noundef %45, i32 noundef 40000000) #5
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
