; ModuleID = 'pi.c'
source_filename = "pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: readwrite) uwtable
define dso_local void @myadd(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load float, ptr %0, align 4, !tbaa !5
  %4 = load float, ptr %1, align 4, !tbaa !5
  %5 = fadd float %3, %4
  store float %5, ptr %0, align 4, !tbaa !5
  ret void
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #1 {
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %4

4:                                                ; preds = %12, %2
  %5 = phi float [ 0.000000e+00, %2 ], [ %28, %12 ]
  %6 = phi i64 [ 1, %2 ], [ %31, %12 ]
  %7 = phi i64 [ 1907, %2 ], [ %14, %12 ]
  %8 = phi i64 [ 1, %2 ], [ %32, %12 ]
  %9 = phi float [ 5.813000e+03, %2 ], [ %20, %12 ]
  %10 = phi <2 x float> [ undef, %2 ], [ %23, %12 ]
  %11 = icmp eq i64 %8, 40000001
  br i1 %11, label %33, label %12

12:                                               ; preds = %4
  %13 = mul nuw nsw i64 %7, 27611
  %14 = urem i64 %13, 74383
  %15 = sitofp i64 %14 to float
  %16 = fmul float %9, 1.307000e+03
  %17 = fdiv float %16, 5.471000e+03
  %18 = fptosi float %17 to i64
  %19 = sitofp i64 %18 to float
  %20 = tail call float @llvm.fmuladd.f32(float %19, float -5.471000e+03, float %16)
  %21 = insertelement <2 x float> poison, float %20, i64 0
  %22 = insertelement <2 x float> %21, float %15, i64 1
  %23 = fdiv <2 x float> %22, <float 5.471000e+03, float 7.438300e+04>
  %24 = fmul <2 x float> %23, %23
  %25 = extractelement <2 x float> %24, i64 0
  %26 = extractelement <2 x float> %23, i64 1
  %27 = tail call float @llvm.fmuladd.f32(float %26, float %26, float %25)
  %28 = fadd float %5, %27
  %29 = fcmp ole float %27, 1.000000e+00
  %30 = zext i1 %29 to i64
  %31 = add nuw nsw i64 %6, %30
  %32 = add nuw nsw i64 %8, 1
  br label %4, !llvm.loop !9

33:                                               ; preds = %4
  %34 = extractelement <2 x float> %10, i64 1
  %35 = fpext float %34 to double
  %36 = extractelement <2 x float> %10, i64 0
  %37 = fpext float %36 to double
  %38 = trunc i64 %6 to i32
  %39 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %35, double noundef %37, i32 noundef %38, i32 noundef 40000001) #5
  %40 = sitofp i64 %6 to float
  %41 = fpext float %40 to double
  %42 = fmul double %41, 4.000000e+00
  %43 = fdiv double %42, 4.000000e+07
  %44 = fptrunc double %43 to float
  %45 = fpext float %44 to double
  %46 = fpext float %5 to double
  %47 = fmul double %46, 0.000000e+00
  %48 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %45, double noundef %47, i32 noundef 40000000) #5
  ret i32 0
}

; Function Attrs: minsize nofree nounwind optsize
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #4

attributes #0 = { minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { minsize nofree nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { minsize nofree nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nofree nounwind }
attributes #5 = { minsize optsize }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 17.0.6"}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
