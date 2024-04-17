; ModuleID = 'pi_unoptimized.ll'
source_filename = "pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define dso_local void @myadd(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load float, ptr %0, align 4
  %4 = load float, ptr %1, align 4
  %5 = fadd float %3, %4
  store float %5, ptr %0, align 4
  ret void
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #1 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %3, align 4
  br label %5

5:                                                ; preds = %6, %2
  %.031 = phi float [ undef, %2 ], [ %16, %6 ]
  %.030 = phi i64 [ 1, %2 ], [ %.1, %6 ]
  %.029 = phi i64 [ 1907, %2 ], [ %8, %6 ]
  %.028 = phi float [ undef, %2 ], [ %10, %6 ]
  %.027 = phi i64 [ 1, %2 ], [ %21, %6 ]
  %.0 = phi float [ 5.813000e+03, %2 ], [ %15, %6 ]
  %exitcond.not = icmp eq i64 %.027, 40000001
  br i1 %exitcond.not, label %22, label %6

6:                                                ; preds = %5
  %7 = mul nuw nsw i64 %.029, 27611
  %8 = urem i64 %7, 74383
  %9 = sitofp i64 %8 to float
  %10 = fdiv float %9, 7.438300e+04
  %11 = fmul float %.0, 1.307000e+03
  %12 = fdiv float %11, 5.471000e+03
  %13 = fptosi float %12 to i64
  %14 = sitofp i64 %13 to float
  %15 = tail call float @llvm.fmuladd.f32(float %14, float -5.471000e+03, float %11)
  %16 = fdiv float %15, 5.471000e+03
  %17 = fmul float %16, %16
  %18 = tail call float @llvm.fmuladd.f32(float %10, float %10, float %17)
  store float %18, ptr %4, align 4
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %4)
  %19 = fcmp ole float %18, 1.000000e+00
  %20 = zext i1 %19 to i64
  %.1 = add nuw nsw i64 %.030, %20
  %21 = add nuw nsw i64 %.027, 1
  br label %5, !llvm.loop !6

22:                                               ; preds = %5
  %23 = fpext float %.028 to double
  %24 = fpext float %.031 to double
  %25 = trunc i64 %.030 to i32
  %26 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %23, double noundef %24, i32 noundef %25, i32 noundef 40000001)
  %27 = sitofp i64 %.030 to float
  %28 = fpext float %27 to double
  %29 = fmul double %28, 4.000000e+00
  %30 = fdiv double %29, 4.000000e+07
  %31 = fptrunc double %30 to float
  %32 = fpext float %31 to double
  %33 = load float, ptr %3, align 4
  %34 = fpext float %33 to double
  %35 = fmul double %34, 0.000000e+00
  %36 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %32, double noundef %35, i32 noundef 40000000)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #4

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nofree nounwind }

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
