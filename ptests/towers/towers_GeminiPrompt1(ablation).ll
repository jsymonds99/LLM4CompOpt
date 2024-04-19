; ModuleID = 'towers_unoptimized.ll'
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
@.str.4 = private unnamed_addr constant [19 x i8] c" Error in Towers.\0A\00", align 1
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
  %2 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, ptr noundef %0) #5
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
  br i1 %2, label %3, label %8

3:                                                ; preds = %0
  %4 = load i32, ptr @freelist, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %5, i32 1
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr @freelist, align 4
  br label %9

8:                                                ; preds = %0
  call void @Error(ptr noundef nonnull @.str.1)
  br label %9

9:                                                ; preds = %8, %3
  %.0 = phi i32 [ %4, %3 ], [ 0, %8 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Push(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %3
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %._crit_edge

7:                                                ; preds = %2
  %8 = sext i32 %1 to i64
  %9 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %11
  %13 = load i32, ptr %12, align 8
  %.not1 = icmp sgt i32 %13, %0
  br i1 %.not1, label %._crit_edge, label %14

14:                                               ; preds = %7
  call void @Error(ptr noundef nonnull @.str.2)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %7, %2
  %.1 = phi i32 [ 0, %2 ], [ 1, %14 ], [ 0, %7 ]
  %.not = icmp eq i32 %.1, 0
  br i1 %.not, label %15, label %._crit_edge9

15:                                               ; preds = %._crit_edge
  %16 = call i32 @Getelement()
  %17 = sext i32 %1 to i64
  %18 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = sext i32 %16 to i64
  %21 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %20, i32 1
  store i32 %19, ptr %21, align 4
  %22 = sext i32 %1 to i64
  %23 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %22
  store i32 %16, ptr %23, align 4
  %24 = sext i32 %16 to i64
  %25 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %24
  store i32 %0, ptr %25, align 8
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %15
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Init(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  call void @Makenull(i32 noundef %0)
  br label %3

3:                                                ; preds = %5, %2
  %storemerge = phi i32 [ %1, %2 ], [ %6, %5 ]
  %4 = icmp sgt i32 %storemerge, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  call void @Push(i32 noundef %storemerge, i32 noundef %0)
  %6 = add nsw i32 %storemerge, -1
  br label %3, !llvm.loop !6

7:                                                ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Pop(i32 noundef %0) local_unnamed_addr #2 {
  %2 = sext i32 %0 to i64
  %3 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %2
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %30

6:                                                ; preds = %1
  %7 = sext i32 %0 to i64
  %8 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %10
  %12 = load i32, ptr %11, align 8
  %13 = sext i32 %0 to i64
  %14 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %16, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr @freelist, align 4
  %20 = sext i32 %0 to i64
  %21 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %23, i32 1
  store i32 %19, ptr %24, align 4
  %25 = sext i32 %0 to i64
  %26 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  store i32 %27, ptr @freelist, align 4
  %28 = sext i32 %0 to i64
  %29 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %28
  store i32 %18, ptr %29, align 4
  br label %31

30:                                               ; preds = %1
  call void @Error(ptr noundef nonnull @.str.3)
  br label %31

31:                                               ; preds = %30, %6
  %storemerge = phi i32 [ 0, %30 ], [ %12, %6 ]
  ret i32 %storemerge
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Move(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = call i32 @Pop(i32 noundef %0)
  call void @Push(i32 noundef %3, i32 noundef %1)
  %4 = load i32, ptr @movesdone, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, ptr @movesdone, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @tower(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = icmp eq i32 %2, 1
  br i1 %4, label %5, label %6

5:                                                ; preds = %3
  call void @Move(i32 noundef %0, i32 noundef %1)
  br label %10

6:                                                ; preds = %3
  %.neg = sub i32 0, %0
  %.neg9 = sub i32 0, %1
  %.neg10 = add i32 %.neg, 6
  %7 = add i32 %.neg10, %.neg9
  %8 = add nsw i32 %2, -1
  call void @tower(i32 noundef %0, i32 noundef %7, i32 noundef %8)
  call void @Move(i32 noundef %0, i32 noundef %1)
  %9 = add nsw i32 %2, -1
  call void @tower(i32 noundef %7, i32 noundef %1, i32 noundef %9)
  br label %10

10:                                               ; preds = %6, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Towers() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %2, %0
  %lsr.iv = phi i64 [ %lsr.iv.next, %2 ], [ -144, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %2 ], [ 1, %0 ]
  %exitcond = icmp ne i64 %lsr.iv, 0
  br i1 %exitcond, label %2, label %5

2:                                                ; preds = %1
  %3 = add nsw i64 %indvars.iv, -1
  %scevgep = getelementptr i8, ptr @cellspace, i64 %lsr.iv
  %scevgep3 = getelementptr i8, ptr %scevgep, i64 156
  %4 = trunc i64 %3 to i32
  store i32 %4, ptr %scevgep3, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lsr.iv.next = add nsw i64 %lsr.iv, 8
  br label %1, !llvm.loop !8

5:                                                ; preds = %1
  store i32 18, ptr @freelist, align 4
  call void @Init(i32 noundef 1, i32 noundef 14)
  call void @Makenull(i32 noundef 2)
  call void @Makenull(i32 noundef 3)
  store i32 0, ptr @movesdone, align 4
  call void @tower(i32 noundef 1, i32 noundef 2, i32 noundef 14)
  %6 = load i32, ptr @movesdone, align 4
  %.not = icmp eq i32 %6, 16383
  br i1 %.not, label %._crit_edge, label %7

7:                                                ; preds = %5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %7
  %8 = load i32, ptr @movesdone, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %8) #5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %2, %0
  %lsr.iv = phi i32 [ %lsr.iv.next, %2 ], [ 100, %0 ]
  %exitcond = icmp ne i32 %lsr.iv, 0
  br i1 %exitcond, label %2, label %3

2:                                                ; preds = %1
  call void @Towers()
  %lsr.iv.next = add nsw i32 %lsr.iv, -1
  br label %1, !llvm.loop !9

3:                                                ; preds = %1
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
