; ModuleID = 'queens.c'
source_filename = "queens.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local local_unnamed_addr global i64 0, align 8
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
@sortlist = dso_local local_unnamed_addr global [5001 x i32] zeroinitializer, align 16
@biggest = dso_local local_unnamed_addr global i32 0, align 4
@littlest = dso_local local_unnamed_addr global i32 0, align 4
@top = dso_local local_unnamed_addr global i32 0, align 4
@z = dso_local local_unnamed_addr global [257 x %struct.complex] zeroinitializer, align 16
@w = dso_local local_unnamed_addr global [257 x %struct.complex] zeroinitializer, align 16
@e = dso_local local_unnamed_addr global [130 x %struct.complex] zeroinitializer, align 16
@zr = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@zi = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@str = private unnamed_addr constant [18 x i8] c" Error in Queens.\00", align 1

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

; Function Attrs: minsize nofree nosync nounwind optsize memory(argmem: readwrite) uwtable
define dso_local void @Try(i32 noundef %0, ptr nocapture noundef %1, ptr nocapture noundef %2, ptr nocapture noundef %3, ptr nocapture noundef %4, ptr nocapture noundef writeonly %5) local_unnamed_addr #2 {
  store i32 0, ptr %1, align 4, !tbaa !9
  %7 = add i32 %0, 7
  %8 = sext i32 %0 to i64
  %9 = getelementptr inbounds i32, ptr %5, i64 %8
  %10 = icmp slt i32 %0, 8
  %11 = add nsw i32 %0, 1
  br label %12

12:                                               ; preds = %44, %6
  %13 = phi i32 [ 0, %6 ], [ %45, %44 ]
  %14 = phi i64 [ 0, %6 ], [ %19, %44 ]
  %15 = icmp eq i32 %13, 0
  %16 = icmp ne i64 %14, 8
  %17 = and i1 %16, %15
  br i1 %17, label %18, label %46

18:                                               ; preds = %12
  %19 = add nuw nsw i64 %14, 1
  store i32 0, ptr %1, align 4, !tbaa !9
  %20 = getelementptr inbounds i32, ptr %3, i64 %19
  %21 = load i32, ptr %20, align 4, !tbaa !9
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %44, label %23

23:                                               ; preds = %18
  %24 = add nsw i64 %19, %8
  %25 = getelementptr inbounds i32, ptr %2, i64 %24
  %26 = load i32, ptr %25, align 4, !tbaa !9
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %44, label %28

28:                                               ; preds = %23
  %29 = trunc i64 %14 to i32
  %30 = xor i32 %29, -1
  %31 = add i32 %7, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, ptr %4, i64 %32
  %34 = load i32, ptr %33, align 4, !tbaa !9
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %44, label %36

36:                                               ; preds = %28
  %37 = trunc i64 %19 to i32
  store i32 %37, ptr %9, align 4, !tbaa !9
  store i32 0, ptr %20, align 4, !tbaa !9
  store i32 0, ptr %25, align 4, !tbaa !9
  store i32 0, ptr %33, align 4, !tbaa !9
  br i1 %10, label %38, label %43

38:                                               ; preds = %36
  tail call void @Try(i32 noundef %11, ptr noundef nonnull %1, ptr noundef nonnull %2, ptr noundef nonnull %3, ptr noundef nonnull %4, ptr noundef nonnull %5) #7
  %39 = load i32, ptr %1, align 4, !tbaa !9
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %44

41:                                               ; preds = %38
  store i32 1, ptr %20, align 4, !tbaa !9
  store i32 1, ptr %25, align 4, !tbaa !9
  store i32 1, ptr %33, align 4, !tbaa !9
  %42 = load i32, ptr %1, align 4, !tbaa !9
  br label %44

43:                                               ; preds = %36
  store i32 1, ptr %1, align 4, !tbaa !9
  br label %44

44:                                               ; preds = %43, %41, %38, %28, %23, %18
  %45 = phi i32 [ 1, %43 ], [ %42, %41 ], [ %39, %38 ], [ 0, %28 ], [ 0, %23 ], [ 0, %18 ]
  br label %12, !llvm.loop !11

46:                                               ; preds = %12
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local void @Doit() local_unnamed_addr #4 {
  %1 = alloca i32, align 4
  %2 = alloca [9 x i32], align 16
  %3 = alloca [17 x i32], align 16
  %4 = alloca [15 x i32], align 16
  %5 = alloca [9 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #8
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %2) #8
  call void @llvm.lifetime.start.p0(i64 68, ptr nonnull %3) #8
  call void @llvm.lifetime.start.p0(i64 60, ptr nonnull %4) #8
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %5) #8
  br label %6

6:                                                ; preds = %25, %0
  %7 = phi i64 [ %26, %25 ], [ -7, %0 ]
  %8 = icmp eq i64 %7, 17
  br i1 %8, label %27, label %9

9:                                                ; preds = %6
  %10 = trunc i64 %7 to i32
  %11 = add i32 %10, -1
  %12 = icmp ult i32 %11, 8
  br i1 %12, label %13, label %16

13:                                               ; preds = %9
  %14 = and i64 %7, 4294967295
  %15 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %14
  store i32 1, ptr %15, align 4, !tbaa !9
  br label %16

16:                                               ; preds = %13, %9
  %17 = icmp sgt i64 %7, 1
  br i1 %17, label %18, label %22

18:                                               ; preds = %16
  %19 = and i64 %7, 4294967295
  %20 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %19
  store i32 1, ptr %20, align 4, !tbaa !9
  %21 = icmp ult i64 %7, 8
  br i1 %21, label %22, label %25

22:                                               ; preds = %16, %18
  %23 = add nsw i64 %7, 7
  %24 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %23
  store i32 1, ptr %24, align 4, !tbaa !9
  br label %25

25:                                               ; preds = %22, %18
  %26 = add nsw i64 %7, 1
  br label %6, !llvm.loop !13

27:                                               ; preds = %6
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5) #7
  %28 = load i32, ptr %1, align 4, !tbaa !9
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %27
  %31 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %32

32:                                               ; preds = %30, %27
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %5) #8
  call void @llvm.lifetime.end.p0(i64 60, ptr nonnull %4) #8
  call void @llvm.lifetime.end.p0(i64 68, ptr nonnull %3) #8
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %2) #8
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #8
  ret void
}

; Function Attrs: minsize nofree nounwind optsize
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local void @Queens(i32 noundef %0) local_unnamed_addr #4 {
  br label %2

2:                                                ; preds = %5, %1
  %3 = phi i32 [ 1, %1 ], [ %6, %5 ]
  %4 = icmp eq i32 %3, 51
  br i1 %4, label %7, label %5

5:                                                ; preds = %2
  tail call void @Doit() #7
  %6 = add nuw nsw i32 %3, 1
  br label %2, !llvm.loop !14

7:                                                ; preds = %2
  %8 = add nsw i32 %0, 1
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %8) #7
  ret void
}

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local i32 @main() local_unnamed_addr #4 {
  br label %1

1:                                                ; preds = %4, %0
  %2 = phi i32 [ 0, %0 ], [ %5, %4 ]
  %3 = icmp eq i32 %2, 100
  br i1 %3, label %6, label %4

4:                                                ; preds = %1
  tail call void @Queens(i32 noundef %2) #7
  %5 = add nuw nsw i32 %2, 1
  br label %1, !llvm.loop !15

6:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #6

attributes #0 = { minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { minsize mustprogress nofree norecurse nosync nounwind optsize willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { minsize nofree nosync nounwind optsize memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { minsize nofree nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { minsize nofree nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind }
attributes #7 = { minsize optsize }
attributes #8 = { nounwind }

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
