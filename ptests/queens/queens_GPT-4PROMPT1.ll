; ModuleID = 'queens_unoptimized.ll'
source_filename = "queens.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [19 x i8] c" Error in Queens.\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local global float 0.000000e+00, align 4
@fixed = dso_local global float 0.000000e+00, align 4
@floated = dso_local global float 0.000000e+00, align 4
@permarray = dso_local global [11 x i32] zeroinitializer, align 16
@pctr = dso_local global i32 0, align 4
@tree = dso_local global ptr null, align 8
@stack = dso_local global [4 x i32] zeroinitializer, align 16
@cellspace = dso_local global [19 x %struct.element] zeroinitializer, align 16
@freelist = dso_local global i32 0, align 4
@movesdone = dso_local global i32 0, align 4
@ima = dso_local global [41 x [41 x i32]] zeroinitializer, align 16
@imb = dso_local global [41 x [41 x i32]] zeroinitializer, align 16
@imr = dso_local global [41 x [41 x i32]] zeroinitializer, align 16
@rma = dso_local global [41 x [41 x float]] zeroinitializer, align 16
@rmb = dso_local global [41 x [41 x float]] zeroinitializer, align 16
@rmr = dso_local global [41 x [41 x float]] zeroinitializer, align 16
@piececount = dso_local global [4 x i32] zeroinitializer, align 16
@class = dso_local global [13 x i32] zeroinitializer, align 16
@piecemax = dso_local global [13 x i32] zeroinitializer, align 16
@puzzl = dso_local global [512 x i32] zeroinitializer, align 16
@p = dso_local global [13 x [512 x i32]] zeroinitializer, align 16
@n = dso_local global i32 0, align 4
@kount = dso_local global i32 0, align 4
@sortlist = dso_local global [5001 x i32] zeroinitializer, align 16
@biggest = dso_local global i32 0, align 4
@littlest = dso_local global i32 0, align 4
@top = dso_local global i32 0, align 4
@z = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@w = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@e = dso_local global [130 x %struct.complex] zeroinitializer, align 16
@zr = dso_local global float 0.000000e+00, align 4
@zi = dso_local global float 0.000000e+00, align 4
@str = private unnamed_addr constant [18 x i8] c" Error in Queens.\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Initrand() #0 {
  store i64 74755, ptr @seed, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Rand() #0 {
  %1 = load i64, ptr @seed, align 8
  %2 = mul nsw i64 %1, 1309
  %3 = add nsw i64 %2, 13849
  %4 = and i64 %3, 65535
  store i64 %4, ptr @seed, align 8
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Try(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  store i32 0, ptr %1, align 4
  br label %7

7:                                                ; preds = %36, %6
  %8 = phi i32 [ 0, %6 ], [ %.pre, %36 ]
  %.0 = phi i32 [ 0, %6 ], [ %12, %36 ]
  %9 = icmp eq i32 %8, 0
  %10 = icmp ne i32 %.0, 8
  %or.cond = and i1 %9, %10
  br i1 %or.cond, label %11, label %.thread

11:                                               ; preds = %7
  %12 = add nuw nsw i32 %.0, 1
  store i32 0, ptr %1, align 4
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %3, i64 %13
  %15 = load i32, ptr %14, align 4
  %.not = icmp eq i32 %15, 0
  br i1 %.not, label %36, label %16

16:                                               ; preds = %11
  %17 = add nsw i32 %12, %0
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr %2, i64 %18
  %20 = load i32, ptr %19, align 4
  %.not2 = icmp eq i32 %20, 0
  br i1 %.not2, label %36, label %21

21:                                               ; preds = %16
  %22 = sub nsw i32 %0, %12
  %23 = add nsw i32 %22, 7
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, ptr %4, i64 %24
  %26 = load i32, ptr %25, align 4
  %.not3 = icmp eq i32 %26, 0
  br i1 %.not3, label %36, label %27

27:                                               ; preds = %21
  %28 = sext i32 %0 to i64
  %29 = getelementptr inbounds i32, ptr %5, i64 %28
  store i32 %12, ptr %29, align 4
  store i32 0, ptr %14, align 4
  store i32 0, ptr %19, align 4
  store i32 0, ptr %25, align 4
  %30 = icmp slt i32 %0, 8
  br i1 %30, label %31, label %35

31:                                               ; preds = %27
  %32 = add nsw i32 %0, 1
  tail call void @Try(i32 noundef %32, ptr noundef nonnull %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %33 = load i32, ptr %1, align 4
  %.not4 = icmp eq i32 %33, 0
  br i1 %.not4, label %34, label %36

34:                                               ; preds = %31
  store i32 1, ptr %14, align 4
  store i32 1, ptr %19, align 4
  store i32 1, ptr %25, align 4
  %.pre.pre = load i32, ptr %1, align 4
  br label %36

35:                                               ; preds = %27
  store i32 1, ptr %1, align 4
  br label %36

36:                                               ; preds = %35, %34, %31, %21, %16, %11
  %.pre = phi i32 [ 1, %35 ], [ %.pre.pre, %34 ], [ %33, %31 ], [ 0, %21 ], [ 0, %16 ], [ 0, %11 ]
  br label %7, !llvm.loop !6

.thread:                                          ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Doit() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [9 x i32], align 16
  %3 = alloca [17 x i32], align 16
  %4 = alloca [15 x i32], align 16
  %5 = alloca [9 x i32], align 16
  br i1 true, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %0
  br label %._crit_edge

.lr.ph:                                           ; preds = %0, %22
  %.0 = phi i32 [ -7, %0 ], [ %23, %22 ]
  %6 = icmp sgt i32 %.0, 0
  br i1 %6, label %7, label %thread-pre-split

7:                                                ; preds = %.lr.ph
  %8 = icmp slt i32 %.0, 9
  br i1 %8, label %9, label %.thread

9:                                                ; preds = %7
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %10
  store i32 1, ptr %11, align 4
  br label %12

thread-pre-split:                                 ; preds = %.lr.ph
  br label %12

12:                                               ; preds = %thread-pre-split, %9
  %13 = icmp sgt i32 %.0, 1
  br i1 %13, label %.thread, label %thread-pre-split1

.thread:                                          ; preds = %7, %12
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %14
  store i32 1, ptr %15, align 4
  br label %16

thread-pre-split1:                                ; preds = %12
  br label %16

16:                                               ; preds = %thread-pre-split1, %.thread
  %17 = icmp slt i32 %.0, 8
  br i1 %17, label %18, label %22

18:                                               ; preds = %16
  %19 = add nsw i32 %.0, 7
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %20
  store i32 1, ptr %21, align 4
  br label %22

22:                                               ; preds = %18, %16
  %23 = add nsw i32 %.0, 1
  %24 = icmp slt i32 %.0, 16
  br i1 %24, label %.lr.ph, label %._crit_edge, !llvm.loop !8

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %22
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %25 = load i32, ptr %1, align 4
  %.not = icmp eq i32 %25, 0
  br i1 %.not, label %26, label %27

26:                                               ; preds = %._crit_edge
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %27

27:                                               ; preds = %26, %._crit_edge
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #0 {
  br i1 true, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %1
  br label %._crit_edge

.lr.ph:                                           ; preds = %1, %.lr.ph
  %.0 = phi i32 [ 1, %1 ], [ %2, %.lr.ph ]
  tail call void @Doit()
  %2 = add nuw nsw i32 %.0, 1
  %3 = icmp ult i32 %.0, 50
  br i1 %3, label %.lr.ph, label %._crit_edge, !llvm.loop !9

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %.lr.ph
  %4 = add nsw i32 %0, 1
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %4) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br i1 true, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %0
  br label %._crit_edge

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.0 = phi i32 [ 0, %0 ], [ %1, %.lr.ph ]
  tail call void @Queens(i32 noundef %.0)
  %1 = add nuw nsw i32 %.0, 1
  %2 = icmp ult i32 %.0, 99
  br i1 %2, label %.lr.ph, label %._crit_edge, !llvm.loop !10

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %.lr.ph
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { nounwind }

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
