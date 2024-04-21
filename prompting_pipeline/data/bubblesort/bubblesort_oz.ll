; ModuleID = 'bubblesort.c'
source_filename = "bubblesort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local local_unnamed_addr global i64 0, align 8
@biggest = dso_local local_unnamed_addr global i32 0, align 4
@littlest = dso_local local_unnamed_addr global i32 0, align 4
@sortlist = dso_local local_unnamed_addr global [5001 x i32] zeroinitializer, align 16
@top = dso_local local_unnamed_addr global i32 0, align 4
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@fixed = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@floated = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@permarray = dso_local local_unnamed_addr global [11 x i32] zeroinitializer, align 16
@pctr = dso_local local_unnamed_addr global i32 0, align 4
@tree = dso_local local_unnamed_addr global ptr null, align 8
@stack = dso_local local_unnamed_addr global [4 x i32] zeroinitializer, align 16
@cellspace = dso_local local_unnamed_addr global [19 x %struct.element] zeroinitializer, align 16
@freelist = dso_local local_unnamed_addr global i32 0, align 4
@movesdone = dso_local local_unnamed_addr global i32 0, align 4
@ima = dso_local local_unnamed_addr global [41 x [41 x i32]] zeroinitializer, align 16
@imb = dso_local local_unnamed_addr global [41 x [41 x i32]] zeroinitializer, align 16
@imr = dso_local local_unnamed_addr global [41 x [41 x i32]] zeroinitializer, align 16
@rma = dso_local local_unnamed_addr global [41 x [41 x float]] zeroinitializer, align 16
@rmb = dso_local local_unnamed_addr global [41 x [41 x float]] zeroinitializer, align 16
@rmr = dso_local local_unnamed_addr global [41 x [41 x float]] zeroinitializer, align 16
@piececount = dso_local local_unnamed_addr global [4 x i32] zeroinitializer, align 16
@class = dso_local local_unnamed_addr global [13 x i32] zeroinitializer, align 16
@piecemax = dso_local local_unnamed_addr global [13 x i32] zeroinitializer, align 16
@puzzl = dso_local local_unnamed_addr global [512 x i32] zeroinitializer, align 16
@p = dso_local local_unnamed_addr global [13 x [512 x i32]] zeroinitializer, align 16
@n = dso_local local_unnamed_addr global i32 0, align 4
@kount = dso_local local_unnamed_addr global i32 0, align 4
@z = dso_local local_unnamed_addr global [257 x %struct.complex] zeroinitializer, align 16
@w = dso_local local_unnamed_addr global [257 x %struct.complex] zeroinitializer, align 16
@e = dso_local local_unnamed_addr global [130 x %struct.complex] zeroinitializer, align 16
@zr = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@zi = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@str = private unnamed_addr constant [18 x i8] c"Error3 in Bubble.\00", align 1

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @Initrand() local_unnamed_addr #0 {
  store i64 74755, ptr @seed, align 8, !tbaa !5
  ret void
}

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @Rand() local_unnamed_addr #1 {
  %1 = load i64, ptr @seed, align 8, !tbaa !5
  %2 = mul nsw i64 %1, 1309
  %3 = add nsw i64 %2, 13849
  %4 = and i64 %3, 65535
  store i64 %4, ptr @seed, align 8, !tbaa !5
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(write, inaccessiblemem: none) uwtable
define dso_local void @bInitarr() local_unnamed_addr #2 {
  store i32 0, ptr @biggest, align 4, !tbaa !9
  store i32 0, ptr @littlest, align 4, !tbaa !9
  br label %1

1:                                                ; preds = %21, %0
  %2 = phi i64 [ %24, %21 ], [ 1, %0 ]
  %3 = phi i32 [ %22, %21 ], [ 0, %0 ]
  %4 = phi i32 [ %23, %21 ], [ 0, %0 ]
  %5 = phi i64 [ %10, %21 ], [ 74755, %0 ]
  %6 = icmp eq i64 %2, 501
  br i1 %6, label %25, label %7

7:                                                ; preds = %1
  %8 = mul nuw nsw i64 %5, 1309
  %9 = add nuw nsw i64 %8, 13849
  %10 = and i64 %9, 65535
  %11 = trunc i64 %10 to i32
  %12 = add nsw i32 %11, -50000
  %13 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %2
  store i32 %12, ptr %13, align 4, !tbaa !9
  %14 = icmp sgt i32 %12, %4
  br i1 %14, label %17, label %15

15:                                               ; preds = %7
  %16 = icmp slt i32 %12, %3
  br i1 %16, label %17, label %21

17:                                               ; preds = %15, %7
  %18 = phi ptr [ @biggest, %7 ], [ @littlest, %15 ]
  %19 = phi i32 [ %3, %7 ], [ %12, %15 ]
  %20 = phi i32 [ %12, %7 ], [ %4, %15 ]
  store i32 %12, ptr %18, align 4, !tbaa !9
  br label %21

21:                                               ; preds = %17, %15
  %22 = phi i32 [ %3, %15 ], [ %19, %17 ]
  %23 = phi i32 [ %4, %15 ], [ %20, %17 ]
  %24 = add nuw nsw i64 %2, 1
  br label %1, !llvm.loop !11

25:                                               ; preds = %1
  store i64 %5, ptr @seed, align 8, !tbaa !5
  ret void
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local void @Bubble(i32 noundef %0) local_unnamed_addr #3 {
  tail call void @bInitarr() #6
  br label %2

2:                                                ; preds = %17, %1
  %3 = phi i64 [ %18, %17 ], [ 500, %1 ]
  %4 = icmp ugt i64 %3, 1
  br i1 %4, label %5, label %19

5:                                                ; preds = %2, %16
  %6 = phi i64 [ %11, %16 ], [ 1, %2 ]
  %7 = icmp eq i64 %6, %3
  br i1 %7, label %17, label %8

8:                                                ; preds = %5
  %9 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %6
  %10 = load i32, ptr %9, align 4, !tbaa !9
  %11 = add nuw nsw i64 %6, 1
  %12 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4, !tbaa !9
  %14 = icmp sgt i32 %10, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %8
  store i32 %13, ptr %9, align 4, !tbaa !9
  store i32 %10, ptr %12, align 4, !tbaa !9
  br label %16

16:                                               ; preds = %15, %8
  br label %5, !llvm.loop !13

17:                                               ; preds = %5
  %18 = add nsw i64 %3, -1
  br label %2, !llvm.loop !14

19:                                               ; preds = %2
  store i32 1, ptr @top, align 4, !tbaa !9
  %20 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4, !tbaa !9
  %21 = load i32, ptr @littlest, align 4, !tbaa !9
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %23, label %27

23:                                               ; preds = %19
  %24 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 500), align 16, !tbaa !9
  %25 = load i32, ptr @biggest, align 4, !tbaa !9
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %29, label %27

27:                                               ; preds = %23, %19
  %28 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %29

29:                                               ; preds = %27, %23
  %30 = add nsw i32 %0, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4, !tbaa !9
  %34 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %33) #6
  ret void
}

; Function Attrs: minsize nofree nounwind optsize
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
  br label %1

1:                                                ; preds = %4, %0
  %2 = phi i32 [ 0, %0 ], [ %5, %4 ]
  %3 = icmp eq i32 %2, 100
  br i1 %3, label %6, label %4

4:                                                ; preds = %1
  tail call void @Bubble(i32 noundef %2) #6
  %5 = add nuw nsw i32 %2, 1
  br label %1, !llvm.loop !15

6:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { minsize nofree norecurse nosync nounwind optsize memory(write, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { minsize nofree nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { minsize nofree nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind }
attributes #6 = { minsize optsize }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 17.0.6"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
