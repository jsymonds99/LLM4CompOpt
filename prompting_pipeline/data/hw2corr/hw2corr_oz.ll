; ModuleID = 'something.c'
source_filename = "something.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str.1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00", align 1

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite) uwtable
define dso_local void @myadd(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %7, %2
  %4 = phi i32 [ 1, %2 ], [ %15, %7 ]
  %5 = icmp eq i32 %4, 10
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  ret void

7:                                                ; preds = %3
  %8 = load float, ptr %1, align 4, !tbaa !5
  %9 = fptosi float %8 to i32
  %10 = srem i32 %9, %4
  %11 = load float, ptr %0, align 4, !tbaa !5
  %12 = mul nsw i32 %10, %4
  %13 = sitofp i32 %12 to float
  %14 = fadd float %11, %13
  store float %14, ptr %0, align 4, !tbaa !5
  %15 = add nuw nsw i32 %4, 1
  br label %3, !llvm.loop !9
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #2 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #6
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #6
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store float 0.000000e+00, ptr %3, align 4, !tbaa !5
  br label %6

6:                                                ; preds = %13, %2
  %7 = phi i64 [ 1, %2 ], [ %31, %13 ]
  %8 = phi i64 [ 1907, %2 ], [ %15, %13 ]
  %9 = phi i64 [ 1, %2 ], [ %32, %13 ]
  %10 = phi float [ 5.813000e+03, %2 ], [ %21, %13 ]
  %11 = phi <2 x float> [ undef, %2 ], [ %24, %13 ]
  %12 = icmp eq i64 %9, 40000001
  br i1 %12, label %33, label %13

13:                                               ; preds = %6
  %14 = mul nuw nsw i64 %8, 27611
  %15 = urem i64 %14, 74383
  %16 = sitofp i64 %15 to float
  %17 = fmul float %10, 1.307000e+03
  %18 = fdiv float %17, 5.471000e+03
  %19 = fptosi float %18 to i64
  %20 = sitofp i64 %19 to float
  %21 = tail call float @llvm.fmuladd.f32(float %20, float -5.471000e+03, float %17)
  %22 = insertelement <2 x float> poison, float %21, i64 0
  %23 = insertelement <2 x float> %22, float %16, i64 1
  %24 = fdiv <2 x float> %23, <float 5.471000e+03, float 7.438300e+04>
  %25 = fmul <2 x float> %24, %24
  %26 = extractelement <2 x float> %25, i64 0
  %27 = extractelement <2 x float> %24, i64 1
  %28 = tail call float @llvm.fmuladd.f32(float %27, float %27, float %26)
  store float %28, ptr %4, align 4, !tbaa !5
  call void @myadd(ptr noundef nonnull %3, ptr noundef nonnull %4) #7
  %29 = fcmp ole float %28, 1.000000e+00
  %30 = zext i1 %29 to i64
  %31 = add nuw nsw i64 %7, %30
  %32 = add nuw nsw i64 %9, 1
  br label %6, !llvm.loop !11

33:                                               ; preds = %6
  %34 = extractelement <2 x float> %11, i64 1
  %35 = fpext float %34 to double
  %36 = extractelement <2 x float> %11, i64 0
  %37 = fpext float %36 to double
  %38 = trunc i64 %7 to i32
  %39 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %35, double noundef %37, i32 noundef %38, i32 noundef 40000001) #7
  %40 = sitofp i64 %7 to float
  %41 = fpext float %40 to double
  %42 = fmul double %41, 4.000000e+00
  %43 = fdiv double %42, 4.000000e+07
  %44 = fptrunc double %43 to float
  %45 = fpext float %44 to double
  %46 = load float, ptr %3, align 4, !tbaa !5
  %47 = fpext float %46 to double
  %48 = fmul double %47, 0.000000e+00
  %49 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %45, double noundef %48, i32 noundef 40000000) #7
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #6
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #6
  ret i32 0
}

; Function Attrs: minsize nofree nounwind optsize
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #4

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { minsize nofree nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { minsize nofree nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nofree nounwind }
attributes #6 = { nounwind }
attributes #7 = { minsize optsize }

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
!11 = distinct !{!11, !10}
