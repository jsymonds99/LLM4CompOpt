; ModuleID = 'queens_unoptimized.ll'
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

; Function Attrs: nofree noinline nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @Try(i32 noundef %0, ptr nocapture noundef %1, ptr nocapture noundef %2, ptr nocapture noundef %3, ptr nocapture noundef %4, ptr nocapture noundef writeonly %5) local_unnamed_addr #2 {
  store i32 0, ptr %1, align 4
  %7 = add i32 %0, 7
  %8 = sext i32 %0 to i64
  %9 = getelementptr inbounds i32, ptr %5, i64 %8
  %10 = icmp slt i32 %0, 8
  %11 = add nsw i32 %0, 1
  br label %12

12:                                               ; preds = %.backedge, %6
  %13 = phi i32 [ 0, %6 ], [ %.be, %.backedge ]
  %indvars.iv = phi i64 [ 0, %6 ], [ %indvars.iv.next, %.backedge ]
  %.not = icmp eq i32 %13, 0
  %14 = icmp ne i64 %indvars.iv, 8
  %15 = and i1 %14, %.not
  br i1 %15, label %16, label %36

16:                                               ; preds = %12
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  store i32 0, ptr %1, align 4
  %17 = getelementptr inbounds i32, ptr %3, i64 %indvars.iv.next
  %18 = load i32, ptr %17, align 4
  %.not41 = icmp eq i32 %18, 0
  br i1 %.not41, label %.backedge, label %19

19:                                               ; preds = %16
  %20 = add nsw i64 %indvars.iv.next, %8
  %21 = getelementptr inbounds i32, ptr %2, i64 %20
  %22 = load i32, ptr %21, align 4
  %.not42 = icmp eq i32 %22, 0
  br i1 %.not42, label %.backedge, label %23

23:                                               ; preds = %19
  %24 = trunc i64 %indvars.iv to i32
  %25 = xor i32 %24, -1
  %26 = add i32 %7, %25
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %4, i64 %27
  %29 = load i32, ptr %28, align 4
  %.not43 = icmp eq i32 %29, 0
  br i1 %.not43, label %.backedge, label %30

30:                                               ; preds = %23
  %31 = trunc i64 %indvars.iv.next to i32
  store i32 %31, ptr %9, align 4
  store i32 0, ptr %17, align 4
  store i32 0, ptr %21, align 4
  store i32 0, ptr %28, align 4
  br i1 %10, label %32, label %35

32:                                               ; preds = %30
  tail call void @Try(i32 noundef %11, ptr noundef nonnull %1, ptr noundef nonnull %2, ptr noundef nonnull %3, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %33 = load i32, ptr %1, align 4
  %.not44 = icmp eq i32 %33, 0
  br i1 %.not44, label %34, label %.backedge

34:                                               ; preds = %32
  store i32 1, ptr %17, align 4
  store i32 1, ptr %21, align 4
  store i32 1, ptr %28, align 4
  %.pre = load i32, ptr %1, align 4
  br label %.backedge

35:                                               ; preds = %30
  store i32 1, ptr %1, align 4
  br label %.backedge

.backedge:                                        ; preds = %35, %34, %32, %23, %19, %16
  %.be = phi i32 [ 1, %35 ], [ %.pre, %34 ], [ %33, %32 ], [ 0, %23 ], [ 0, %19 ], [ 0, %16 ]
  br label %12, !llvm.loop !6

36:                                               ; preds = %12
  ret void
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @Doit() local_unnamed_addr #3 {
  %1 = alloca i32, align 4
  %2 = alloca [9 x i32], align 16
  %3 = alloca [17 x i32], align 16
  %4 = alloca [15 x i32], align 16
  %5 = alloca [9 x i32], align 16
  br label %6

6:                                                ; preds = %21, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %21 ], [ -7, %0 ]
  %exitcond.not = icmp eq i64 %indvars.iv, 17
  br i1 %exitcond.not, label %22, label %7

7:                                                ; preds = %6
  %8 = trunc i64 %indvars.iv to i32
  %9 = add i32 %8, -1
  %or.cond = icmp ult i32 %9, 8
  br i1 %or.cond, label %10, label %13

10:                                               ; preds = %7
  %11 = and i64 %indvars.iv, 4294967295
  %12 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %11
  store i32 1, ptr %12, align 4
  br label %13

13:                                               ; preds = %10, %7
  %14 = icmp sgt i64 %indvars.iv, 1
  br i1 %14, label %15, label %.thread

15:                                               ; preds = %13
  %16 = and i64 %indvars.iv, 4294967295
  %17 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %16
  store i32 1, ptr %17, align 4
  %18 = icmp ult i64 %indvars.iv, 8
  br i1 %18, label %.thread, label %21

.thread:                                          ; preds = %13, %15
  %19 = add nsw i64 %indvars.iv, 7
  %20 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %19
  store i32 1, ptr %20, align 4
  br label %21

21:                                               ; preds = %.thread, %15
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  br label %6, !llvm.loop !8

22:                                               ; preds = %6
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %23 = load i32, ptr %1, align 4
  %.not = icmp eq i32 %23, 0
  br i1 %.not, label %24, label %25

24:                                               ; preds = %22
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %25

25:                                               ; preds = %24, %22
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) local_unnamed_addr #3 {
  br label %2

2:                                                ; preds = %3, %1
  %.0 = phi i32 [ 1, %1 ], [ %4, %3 ]
  %exitcond.not = icmp eq i32 %.0, 51
  br i1 %exitcond.not, label %5, label %3

3:                                                ; preds = %2
  tail call void @Doit()
  %4 = add nuw nsw i32 %.0, 1
  br label %2, !llvm.loop !9

5:                                                ; preds = %2
  %6 = add nsw i32 %0, 1
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %6)
  ret void
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
  br label %1

1:                                                ; preds = %2, %0
  %.0 = phi i32 [ 0, %0 ], [ %3, %2 ]
  %exitcond.not = icmp eq i32 %.0, 100
  br i1 %exitcond.not, label %4, label %2

2:                                                ; preds = %1
  tail call void @Queens(i32 noundef %.0)
  %3 = add nuw nsw i32 %.0, 1
  br label %1, !llvm.loop !10

4:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
