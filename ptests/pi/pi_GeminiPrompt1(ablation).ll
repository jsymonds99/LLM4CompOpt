; ModuleID = 'pi_unoptimized.ll'
source_filename = "pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @myadd(ptr noundef %0, ptr noundef %1) local_unnamed_addr #0 {
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
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %3, align 4
  br label %5

5:                                                ; preds = %2, %5
  %6 = phi i64 [ 1, %2 ], [ %24, %5 ]
  %7 = phi i64 [ 1907, %2 ], [ %10, %5 ]
  %8 = phi float [ 5.813000e+03, %2 ], [ %17, %5 ]
  %lsr.iv5 = phi i64 [ 40000000, %2 ], [ %lsr.iv.next, %5 ]
  %9 = mul nuw nsw i64 %7, 27611
  %10 = urem i64 %9, 74383
  %11 = sitofp i64 %10 to float
  %12 = fdiv float %11, 7.438300e+04
  %13 = fmul float %8, 1.307000e+03
  %14 = fdiv float %13, 5.471000e+03
  %15 = fptosi float %14 to i64
  %16 = sitofp i64 %15 to float
  %17 = call float @llvm.fmuladd.f32(float %16, float -5.471000e+03, float %13)
  %18 = fdiv float %17, 5.471000e+03
  %19 = fmul float %18, %18
  %20 = call float @llvm.fmuladd.f32(float %12, float %12, float %19)
  store float %20, ptr %4, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %4)
  %21 = load float, ptr %4, align 4
  %22 = fcmp ugt float %21, 1.000000e+00
  %23 = add nsw i64 %6, 1
  %24 = select i1 %22, i64 %6, i64 %23
  %lsr.iv.next = add nsw i64 %lsr.iv5, -1
  %exitcond = icmp ne i64 %lsr.iv.next, 0
  br i1 %exitcond, label %5, label %25, !llvm.loop !6

25:                                               ; preds = %5
  %.lcssa4 = phi i64 [ %24, %5 ]
  %.lcssa3 = phi float [ %18, %5 ]
  %.lcssa2 = phi float [ %12, %5 ]
  %26 = fpext float %.lcssa2 to double
  %27 = fpext float %.lcssa3 to double
  %28 = trunc i64 %.lcssa4 to i32
  %29 = trunc i64 40000001 to i32
  %30 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %26, double noundef %27, i32 noundef %28, i32 noundef %29) #5
  %31 = sitofp i64 %.lcssa4 to float
  %32 = fpext float %31 to double
  %33 = fmul double %32, 4.000000e+00
  %34 = fdiv double %33, 4.000000e+07
  %35 = fptrunc double %34 to float
  %36 = fpext float %35 to double
  %37 = load float, ptr %3, align 4
  %38 = fpext float %37 to double
  %39 = fmul double %38, 0.000000e+00
  %40 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %36, double noundef %39, i32 noundef 40000000) #5
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #4

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
