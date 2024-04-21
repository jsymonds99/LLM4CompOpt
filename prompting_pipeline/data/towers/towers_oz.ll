; ModuleID = 'towers.c'
source_filename = "towers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local local_unnamed_addr global i64 0, align 8
@.str = private unnamed_addr constant [22 x i8] c" Error in Towers: %s\0A\00", align 1
@stack = dso_local local_unnamed_addr global [4 x i32] zeroinitializer, align 16
@freelist = dso_local local_unnamed_addr global i32 0, align 4
@cellspace = dso_local local_unnamed_addr global [19 x %struct.element] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [16 x i8] c"out of space   \00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"disc size error\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"nothing to pop \00", align 1
@movesdone = dso_local local_unnamed_addr global i32 0, align 4
@.str.5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@fixed = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@floated = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@permarray = dso_local local_unnamed_addr global [11 x i32] zeroinitializer, align 16
@pctr = dso_local local_unnamed_addr global i32 0, align 4
@tree = dso_local local_unnamed_addr global ptr null, align 8
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
@sortlist = dso_local local_unnamed_addr global [5001 x i32] zeroinitializer, align 16
@biggest = dso_local local_unnamed_addr global i32 0, align 4
@littlest = dso_local local_unnamed_addr global i32 0, align 4
@top = dso_local local_unnamed_addr global i32 0, align 4
@z = dso_local local_unnamed_addr global [257 x %struct.complex] zeroinitializer, align 16
@w = dso_local local_unnamed_addr global [257 x %struct.complex] zeroinitializer, align 16
@e = dso_local local_unnamed_addr global [130 x %struct.complex] zeroinitializer, align 16
@zr = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@zi = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@str = private unnamed_addr constant [18 x i8] c" Error in Towers.\00", align 1

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

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local void @Error(ptr noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, ptr noundef %0) #5
  ret void
}

; Function Attrs: minsize nofree nounwind optsize
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @Makenull(i32 noundef %0) local_unnamed_addr #0 {
  %2 = sext i32 %0 to i64
  %3 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %2
  store i32 0, ptr %3, align 4, !tbaa !9
  ret void
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local i32 @Getelement() local_unnamed_addr #2 {
  %1 = load i32, ptr @freelist, align 4, !tbaa !9
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %7

3:                                                ; preds = %0
  %4 = zext i32 %1 to i64
  %5 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %4, i32 1
  %6 = load i32, ptr %5, align 4, !tbaa !11
  store i32 %6, ptr @freelist, align 4, !tbaa !9
  br label %8

7:                                                ; preds = %0
  tail call void @Error(ptr noundef nonnull @.str.1) #5
  br label %8

8:                                                ; preds = %7, %3
  %9 = phi i32 [ %1, %3 ], [ 0, %7 ]
  ret i32 %9
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local void @Push(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %3
  %5 = load i32, ptr %4, align 4, !tbaa !9
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %13

7:                                                ; preds = %2
  %8 = zext i32 %5 to i64
  %9 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %8
  %10 = load i32, ptr %9, align 8, !tbaa !13
  %11 = icmp sgt i32 %10, %0
  br i1 %11, label %13, label %12

12:                                               ; preds = %7
  tail call void @Error(ptr noundef nonnull @.str.2) #5
  br label %19

13:                                               ; preds = %2, %7
  %14 = tail call i32 @Getelement() #5, !range !14
  %15 = load i32, ptr %4, align 4, !tbaa !9
  %16 = zext i32 %14 to i64
  %17 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %16
  %18 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %16, i32 1
  store i32 %15, ptr %18, align 4, !tbaa !11
  store i32 %14, ptr %4, align 4, !tbaa !9
  store i32 %0, ptr %17, align 8, !tbaa !13
  br label %19

19:                                               ; preds = %12, %13
  ret void
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local void @Init(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = sext i32 %0 to i64
  %4 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %3
  store i32 0, ptr %4, align 4, !tbaa !9
  br label %5

5:                                                ; preds = %8, %2
  %6 = phi i32 [ %1, %2 ], [ %9, %8 ]
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %5
  tail call void @Push(i32 noundef %6, i32 noundef %0) #5
  %9 = add nsw i32 %6, -1
  br label %5, !llvm.loop !15

10:                                               ; preds = %5
  ret void
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local i32 @Pop(i32 noundef %0) local_unnamed_addr #2 {
  %2 = sext i32 %0 to i64
  %3 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %2
  %4 = load i32, ptr %3, align 4, !tbaa !9
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %13

6:                                                ; preds = %1
  %7 = zext i32 %4 to i64
  %8 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %7
  %9 = load i32, ptr %8, align 8, !tbaa !13
  %10 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %7, i32 1
  %11 = load i32, ptr %10, align 4, !tbaa !11
  %12 = load i32, ptr @freelist, align 4, !tbaa !9
  store i32 %12, ptr %10, align 4, !tbaa !11
  store i32 %4, ptr @freelist, align 4, !tbaa !9
  store i32 %11, ptr %3, align 4, !tbaa !9
  br label %14

13:                                               ; preds = %1
  tail call void @Error(ptr noundef nonnull @.str.3) #5
  br label %14

14:                                               ; preds = %13, %6
  %15 = phi i32 [ %9, %6 ], [ 0, %13 ]
  ret i32 %15
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local void @Move(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = tail call i32 @Pop(i32 noundef %0) #5
  tail call void @Push(i32 noundef %3, i32 noundef %1) #5
  %4 = load i32, ptr @movesdone, align 4, !tbaa !9
  %5 = add nsw i32 %4, 1
  store i32 %5, ptr @movesdone, align 4, !tbaa !9
  ret void
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local void @tower(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  br label %4

4:                                                ; preds = %9, %3
  %5 = phi i32 [ %0, %3 ], [ %11, %9 ]
  %6 = phi i32 [ %2, %3 ], [ %12, %9 ]
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  tail call void @Move(i32 noundef %5, i32 noundef %1) #5
  ret void

9:                                                ; preds = %4
  %10 = add i32 %5, %1
  %11 = sub i32 6, %10
  %12 = add nsw i32 %6, -1
  tail call void @tower(i32 noundef %5, i32 noundef %11, i32 noundef %12) #5
  tail call void @Move(i32 noundef %5, i32 noundef %1) #5
  br label %4
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local void @Towers() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %4, %0
  %2 = phi i64 [ %8, %4 ], [ 1, %0 ]
  %3 = icmp eq i64 %2, 19
  br i1 %3, label %9, label %4

4:                                                ; preds = %1
  %5 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %2, i32 1
  %6 = trunc i64 %2 to i32
  %7 = add i32 %6, -1
  store i32 %7, ptr %5, align 4, !tbaa !11
  %8 = add nuw nsw i64 %2, 1
  br label %1, !llvm.loop !17

9:                                                ; preds = %1
  store i32 18, ptr @freelist, align 4, !tbaa !9
  tail call void @Init(i32 noundef 1, i32 noundef 14) #5
  store i32 0, ptr getelementptr inbounds ([4 x i32], ptr @stack, i64 0, i64 2), align 8, !tbaa !9
  store i32 0, ptr getelementptr inbounds ([4 x i32], ptr @stack, i64 0, i64 3), align 4, !tbaa !9
  store i32 0, ptr @movesdone, align 4, !tbaa !9
  tail call void @tower(i32 noundef 1, i32 noundef 2, i32 noundef 14) #5
  %10 = load i32, ptr @movesdone, align 4, !tbaa !9
  %11 = icmp eq i32 %10, 16383
  br i1 %11, label %15, label %12

12:                                               ; preds = %9
  %13 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %14 = load i32, ptr @movesdone, align 4, !tbaa !9
  br label %15

15:                                               ; preds = %12, %9
  %16 = phi i32 [ %14, %12 ], [ 16383, %9 ]
  %17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %16) #5
  ret void
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %4, %0
  %2 = phi i32 [ 0, %0 ], [ %5, %4 ]
  %3 = icmp eq i32 %2, 100
  br i1 %3, label %6, label %4

4:                                                ; preds = %1
  tail call void @Towers() #5
  %5 = add nuw nsw i32 %2, 1
  br label %1, !llvm.loop !18

6:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #4

attributes #0 = { minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { minsize nofree nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { minsize nofree nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!12, !10, i64 4}
!12 = !{!"element", !10, i64 0, !10, i64 4}
!13 = !{!12, !10, i64 0}
!14 = !{i32 0, i32 -2147483648}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !16}
