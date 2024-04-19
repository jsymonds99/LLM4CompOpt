; ModuleID = 'towers_unoptimized.ll'
source_filename = "towers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i32 }
%1 = type { float, float }

@seed = dso_local local_unnamed_addr global i64 0, align 8
@0 = private unnamed_addr constant [22 x i8] c" Error in Towers: %s\0A\00", align 1
@stack = dso_local local_unnamed_addr global [4 x i32] zeroinitializer, align 16
@freelist = dso_local local_unnamed_addr global i32 0, align 4
@cellspace = dso_local local_unnamed_addr global [19 x %0] zeroinitializer, align 16
@1 = private unnamed_addr constant [16 x i8] c"out of space   \00", align 1
@2 = private unnamed_addr constant [16 x i8] c"disc size error\00", align 1
@3 = private unnamed_addr constant [16 x i8] c"nothing to pop \00", align 1
@movesdone = dso_local local_unnamed_addr global i32 0, align 4
@4 = private unnamed_addr constant [19 x i8] c" Error in Towers.\0A\00", align 1
@5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
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
@z = dso_local local_unnamed_addr global [257 x %1] zeroinitializer, align 16
@w = dso_local local_unnamed_addr global [257 x %1] zeroinitializer, align 16
@e = dso_local local_unnamed_addr global [130 x %1] zeroinitializer, align 16
@zr = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@zi = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@6 = private unnamed_addr constant [18 x i8] c" Error in Towers.\00", align 1

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

; Function Attrs: noinline nounwind uwtable
define dso_local void @Error(ptr noundef %0) local_unnamed_addr #2 {
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, ptr noundef %0) #5
  ret void
}

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #3

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @Makenull(i32 noundef %0) local_unnamed_addr #0 {
  %2 = sext i32 %0 to i64
  %3 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %2
  store i32 0, ptr %3, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Getelement() local_unnamed_addr #2 {
  %1 = load i32, ptr @freelist, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %7

3:                                                ; preds = %0
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds [19 x %0], ptr @cellspace, i64 0, i64 %4, i32 1
  %6 = load i32, ptr %5, align 4
  store i32 %6, ptr @freelist, align 4
  br label %8

7:                                                ; preds = %0
  tail call void @Error(ptr noundef nonnull @1)
  br label %8

8:                                                ; preds = %7, %3
  %9 = phi i32 [ 0, %7 ], [ %1, %3 ]
  ret i32 %9
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Push(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %3
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %13

7:                                                ; preds = %2
  %8 = sext i32 %5 to i64
  %9 = getelementptr inbounds [19 x %0], ptr @cellspace, i64 0, i64 %8
  %10 = load i32, ptr %9, align 8
  %11 = icmp sgt i32 %10, %0
  br i1 %11, label %13, label %12

12:                                               ; preds = %7
  tail call void @Error(ptr noundef nonnull @2)
  br label %19

13:                                               ; preds = %2, %7
  %14 = tail call i32 @Getelement()
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %14 to i64
  %17 = getelementptr inbounds [19 x %0], ptr @cellspace, i64 0, i64 %16
  %18 = getelementptr inbounds [19 x %0], ptr @cellspace, i64 0, i64 %16, i32 1
  store i32 %15, ptr %18, align 4
  store i32 %14, ptr %4, align 4
  store i32 %0, ptr %17, align 8
  br label %19

19:                                               ; preds = %12, %13
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Init(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  tail call void @Makenull(i32 noundef %0)
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %.lr.ph, label %8

.lr.ph:                                           ; preds = %2
  br label %4

4:                                                ; preds = %.lr.ph, %4
  %5 = phi i32 [ %1, %.lr.ph ], [ %6, %4 ]
  tail call void @Push(i32 noundef %5, i32 noundef %0)
  %6 = add nsw i32 %5, -1
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %4, label %._crit_edge, !llvm.loop !6

._crit_edge:                                      ; preds = %4
  br label %8

8:                                                ; preds = %._crit_edge, %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Pop(i32 noundef %0) local_unnamed_addr #2 {
  %2 = sext i32 %0 to i64
  %3 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %2
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %13

6:                                                ; preds = %1
  %7 = sext i32 %4 to i64
  %8 = getelementptr inbounds [19 x %0], ptr @cellspace, i64 0, i64 %7
  %9 = load i32, ptr %8, align 8
  %10 = getelementptr inbounds [19 x %0], ptr @cellspace, i64 0, i64 %7, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = load i32, ptr @freelist, align 4
  store i32 %12, ptr %10, align 4
  store i32 %4, ptr @freelist, align 4
  store i32 %11, ptr %3, align 4
  br label %14

13:                                               ; preds = %1
  tail call void @Error(ptr noundef nonnull @3)
  br label %14

14:                                               ; preds = %13, %6
  %15 = phi i32 [ 0, %13 ], [ %9, %6 ]
  ret i32 %15
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Move(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = tail call i32 @Pop(i32 noundef %0)
  tail call void @Push(i32 noundef %3, i32 noundef %1)
  %4 = load i32, ptr @movesdone, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, ptr @movesdone, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @tower(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %6, %3
  %.tr = phi i32 [ %0, %3 ], [ %10, %6 ]
  %.tr4 = phi i32 [ %2, %3 ], [ %11, %6 ]
  %4 = icmp eq i32 %.tr4, 1
  br i1 %4, label %5, label %6

5:                                                ; preds = %tailrecurse
  tail call void @Move(i32 noundef %.tr, i32 noundef %1)
  br label %12

6:                                                ; preds = %tailrecurse
  %7 = sub i32 0, %.tr
  %8 = sub i32 0, %1
  %9 = add i32 %7, 6
  %10 = add i32 %9, %8
  %11 = add nsw i32 %.tr4, -1
  tail call void @tower(i32 noundef %.tr, i32 noundef %10, i32 noundef %11)
  tail call void @Move(i32 noundef %.tr, i32 noundef %1)
  br label %tailrecurse

12:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Towers() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %0, %1
  %indvars.iv4 = phi i64 [ 1, %0 ], [ %indvars.iv.next, %1 ]
  %lsr.iv3 = phi i64 [ -144, %0 ], [ %lsr.iv.next, %1 ]
  %2 = add nsw i64 %indvars.iv4, -1
  %scevgep = getelementptr i8, ptr @cellspace, i64 %lsr.iv3
  %scevgep2 = getelementptr i8, ptr %scevgep, i64 156
  %3 = trunc i64 %2 to i32
  store i32 %3, ptr %scevgep2, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %lsr.iv.next = add nsw i64 %lsr.iv3, 8
  %exitcond = icmp ne i64 %lsr.iv.next, 0
  br i1 %exitcond, label %1, label %4, !llvm.loop !8

4:                                                ; preds = %1
  store i32 18, ptr @freelist, align 4
  tail call void @Init(i32 noundef 1, i32 noundef 14)
  tail call void @Makenull(i32 noundef 2)
  tail call void @Makenull(i32 noundef 3)
  store i32 0, ptr @movesdone, align 4
  tail call void @tower(i32 noundef 1, i32 noundef 2, i32 noundef 14)
  %5 = load i32, ptr @movesdone, align 4
  %6 = icmp eq i32 %5, 16383
  br i1 %6, label %10, label %7

7:                                                ; preds = %4
  %8 = tail call i32 @puts(ptr nonnull dereferenceable(1) @6)
  %9 = load i32, ptr @movesdone, align 4
  br label %10

10:                                               ; preds = %7, %4
  %11 = phi i32 [ %9, %7 ], [ 16383, %4 ]
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @5, i32 noundef %11) #5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %0, %1
  %lsr.iv1 = phi i32 [ 100, %0 ], [ %lsr.iv.next, %1 ]
  tail call void @Towers()
  %lsr.iv.next = add nsw i32 %lsr.iv1, -1
  %exitcond = icmp ne i32 %lsr.iv.next, 0
  br i1 %exitcond, label %1, label %2, !llvm.loop !9

2:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #4

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!9 = distinct !{!9, !7}
