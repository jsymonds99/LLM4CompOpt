; ModuleID = 'bubblesort_unoptimized.ll'
source_filename = "bubblesort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i32 }
%1 = type { float, float }

@seed = dso_local local_unnamed_addr global i64 0, align 8
@biggest = dso_local local_unnamed_addr global i32 0, align 4
@littlest = dso_local local_unnamed_addr global i32 0, align 4
@sortlist = dso_local local_unnamed_addr global [5001 x i32] zeroinitializer, align 16
@top = dso_local local_unnamed_addr global i32 0, align 4
@0 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@fixed = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@floated = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@permarray = dso_local local_unnamed_addr global [11 x i32] zeroinitializer, align 16
@pctr = dso_local local_unnamed_addr global i32 0, align 4
@tree = dso_local local_unnamed_addr global ptr null, align 8
@stack = dso_local local_unnamed_addr global [4 x i32] zeroinitializer, align 16
@cellspace = dso_local local_unnamed_addr global [19 x %0] zeroinitializer, align 16
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
@z = dso_local local_unnamed_addr global [257 x %1] zeroinitializer, align 16
@w = dso_local local_unnamed_addr global [257 x %1] zeroinitializer, align 16
@e = dso_local local_unnamed_addr global [130 x %1] zeroinitializer, align 16
@zr = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@zi = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@str = private unnamed_addr constant [18 x i8] c"Error3 in Bubble.\00", align 1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @Initrand() local_unnamed_addr #0 {
  store i64 74755, ptr @seed, align 8
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @Rand() local_unnamed_addr #1 {
  %1 = load i64, ptr @seed, align 8
  %2 = mul nsw i64 %1, 1309
  %3 = add nsw i64 %2, 13849
  %4 = and i64 %3, 65535
  store i64 %4, ptr @seed, align 8
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @bInitarr() local_unnamed_addr #2 {
  tail call void @Initrand()
  store i32 0, ptr @biggest, align 4
  store i32 0, ptr @littlest, align 4
  br label %1

1:                                                ; preds = %0, %23
  %indvars.iv7 = phi i64 [ 1, %0 ], [ %indvars.iv.next, %23 ]
  %2 = tail call i32 @Rand(), !range !6
  %.fr1 = freeze i32 %2
  %3 = sext i32 %.fr1 to i64
  %4 = srem i64 %3, 100000
  %5 = trunc i64 %4 to i32
  %6 = add nsw i32 %5, -50000
  %7 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv7
  store i32 %6, ptr %7, align 4
  %8 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv7
  %9 = load i32, ptr %8, align 4
  %10 = load i32, ptr @biggest, align 4
  %11 = icmp sgt i32 %9, %10
  br i1 %11, label %12, label %15

12:                                               ; preds = %1
  %13 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv7
  %14 = load i32, ptr %13, align 4
  store i32 %14, ptr @biggest, align 4
  br label %23

15:                                               ; preds = %1
  %16 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv7
  %17 = load i32, ptr %16, align 4
  %18 = load i32, ptr @littlest, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %23

20:                                               ; preds = %15
  %21 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv7
  %22 = load i32, ptr %21, align 4
  store i32 %22, ptr @littlest, align 4
  br label %23

23:                                               ; preds = %12, %20, %15
  %indvars.iv8 = phi i64 [ %indvars.iv7, %12 ], [ %indvars.iv7, %20 ], [ %indvars.iv7, %15 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 501
  br i1 %exitcond, label %1, label %24, !llvm.loop !7

24:                                               ; preds = %23
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Bubble(i32 noundef %0) local_unnamed_addr #3 {
  tail call void @bInitarr()
  store i32 500, ptr @top, align 4
  br label %2

2:                                                ; preds = %1, %._crit_edge
  %3 = load i32, ptr @top, align 4
  %4 = sext i32 %3 to i64
  %5 = icmp slt i64 1, %4
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2, %20
  %indvars.iv9 = phi i64 [ %indvars.iv.next, %20 ], [ 1, %2 ]
  %6 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv9
  %7 = load i32, ptr %6, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %8 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv.next
  %9 = load i32, ptr %8, align 4
  %10 = icmp sgt i32 %7, %9
  br i1 %10, label %11, label %20

11:                                               ; preds = %.lr.ph
  %12 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv9
  %13 = load i32, ptr %12, align 4
  %14 = add nuw nsw i64 %indvars.iv9, 1
  %15 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv9
  store i32 %16, ptr %17, align 4
  %18 = add nuw nsw i64 %indvars.iv9, 1
  %19 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %18
  store i32 %13, ptr %19, align 4
  br label %20

20:                                               ; preds = %11, %.lr.ph
  %21 = load i32, ptr @top, align 4
  %22 = sext i32 %21 to i64
  %23 = icmp slt i64 %indvars.iv.next, %22
  br i1 %23, label %.lr.ph, label %._crit_edge, !llvm.loop !9

._crit_edge:                                      ; preds = %20, %2
  %24 = load i32, ptr @top, align 4
  %25 = add nsw i32 %24, -1
  store i32 %25, ptr @top, align 4
  %26 = icmp sgt i32 %25, 1
  br i1 %26, label %2, label %27, !llvm.loop !10

27:                                               ; preds = %._crit_edge
  %28 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4
  %29 = load i32, ptr @littlest, align 4
  %.not = icmp eq i32 %28, %29
  br i1 %.not, label %30, label %33

30:                                               ; preds = %27
  %31 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 500), align 16
  %32 = load i32, ptr @biggest, align 4
  %.not1 = icmp eq i32 %31, %32
  br i1 %.not1, label %34, label %33

33:                                               ; preds = %30, %27
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %34

34:                                               ; preds = %33, %30
  %35 = add nsw i32 %0, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %38) #6
  ret void
}

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
  br label %1

1:                                                ; preds = %1, %0
  %storemerge2 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Bubble(i32 noundef %storemerge2)
  %2 = add nuw nsw i32 %storemerge2, 1
  %exitcond = icmp ne i32 %2, 100
  br i1 %exitcond, label %1, label %3, !llvm.loop !11

3:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = !{i32 0, i32 65536}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
