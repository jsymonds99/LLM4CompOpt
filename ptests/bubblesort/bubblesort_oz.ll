; ModuleID = 'bubblesort_unoptimized.ll'
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

1:                                                ; preds = %11, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %11 ], [ 1, %0 ]
  %exitcond.not = icmp eq i64 %indvars.iv, 501
  br i1 %exitcond.not, label %12, label %2

2:                                                ; preds = %1
  %3 = tail call i32 @Rand(), !range !6
  %4 = add nsw i32 %3, -50000
  %5 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv
  store i32 %4, ptr %5, align 4
  %6 = load i32, ptr @biggest, align 4
  %7 = icmp sgt i32 %4, %6
  br i1 %7, label %.sink.split, label %8

8:                                                ; preds = %2
  %9 = load i32, ptr @littlest, align 4
  %10 = icmp slt i32 %4, %9
  br i1 %10, label %.sink.split, label %11

.sink.split:                                      ; preds = %8, %2
  %biggest.sink = phi ptr [ @biggest, %2 ], [ @littlest, %8 ]
  store i32 %4, ptr %biggest.sink, align 4
  br label %11

11:                                               ; preds = %.sink.split, %8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %1, !llvm.loop !7

12:                                               ; preds = %1
  ret void
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @Bubble(i32 noundef %0) local_unnamed_addr #3 {
  tail call void @bInitarr()
  br label %2

2:                                                ; preds = %11, %1
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %11 ], [ 500, %1 ]
  %3 = icmp ugt i64 %indvars.iv15, 1
  br i1 %3, label %.preheader, label %12

.preheader:                                       ; preds = %2, %.preheader.backedge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader.backedge ], [ 1, %2 ]
  %exitcond.not = icmp eq i64 %indvars.iv, %indvars.iv15
  br i1 %exitcond.not, label %11, label %4

4:                                                ; preds = %.preheader
  %5 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv
  %6 = load i32, ptr %5, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %indvars.iv.next
  %8 = load i32, ptr %7, align 4
  %9 = icmp sgt i32 %6, %8
  br i1 %9, label %10, label %.preheader.backedge

10:                                               ; preds = %4
  store i32 %8, ptr %5, align 4
  store i32 %6, ptr %7, align 4
  br label %.preheader.backedge

.preheader.backedge:                              ; preds = %10, %4
  br label %.preheader, !llvm.loop !9

11:                                               ; preds = %.preheader
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, -1
  br label %2, !llvm.loop !10

12:                                               ; preds = %2
  store i32 1, ptr @top, align 4
  %13 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4
  %14 = load i32, ptr @littlest, align 4
  %.not = icmp eq i32 %13, %14
  br i1 %.not, label %15, label %18

15:                                               ; preds = %12
  %16 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 500), align 16
  %17 = load i32, ptr @biggest, align 4
  %.not13 = icmp eq i32 %16, %17
  br i1 %.not13, label %19, label %18

18:                                               ; preds = %15, %12
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %19

19:                                               ; preds = %18, %15
  %20 = add nsw i32 %0, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %23)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
  br label %1

1:                                                ; preds = %2, %0
  %.0 = phi i32 [ 0, %0 ], [ %3, %2 ]
  %exitcond.not = icmp eq i32 %.0, 100
  br i1 %exitcond.not, label %4, label %2

2:                                                ; preds = %1
  tail call void @Bubble(i32 noundef %.0)
  %3 = add nuw nsw i32 %.0, 1
  br label %1, !llvm.loop !11

4:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind }

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
