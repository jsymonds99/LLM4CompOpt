; ModuleID = 'queens_unoptimized.ll'
source_filename = "queens.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i32 }
%1 = type { float, float }

@seed = dso_local local_unnamed_addr global i64 0, align 8
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
@sortlist = dso_local local_unnamed_addr global [5001 x i32] zeroinitializer, align 16
@biggest = dso_local local_unnamed_addr global i32 0, align 4
@littlest = dso_local local_unnamed_addr global i32 0, align 4
@top = dso_local local_unnamed_addr global i32 0, align 4
@z = dso_local local_unnamed_addr global [257 x %1] zeroinitializer, align 16
@w = dso_local local_unnamed_addr global [257 x %1] zeroinitializer, align 16
@e = dso_local local_unnamed_addr global [130 x %1] zeroinitializer, align 16
@zr = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@zi = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@1 = private unnamed_addr constant [18 x i8] c" Error in Queens.\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Initrand() local_unnamed_addr #0 {
  store i64 74755, ptr @seed, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Rand() local_unnamed_addr #0 {
  %1 = load i64, ptr @seed, align 8
  %2 = mul nsw i64 %1, 1309
  %3 = add nsw i64 %2, 13849
  %4 = and i64 %3, 65535
  store i64 %4, ptr @seed, align 8
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Try(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) local_unnamed_addr #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store i32 %0, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  store ptr %5, ptr %11, align 8
  store i32 0, ptr %1, align 4
  br label %12

12:                                               ; preds = %6, %51
  %13 = phi ptr [ %1, %6 ], [ %54, %51 ]
  %14 = phi ptr [ %1, %6 ], [ %53, %51 ]
  %15 = phi i64 [ 0, %6 ], [ %16, %51 ]
  %16 = add nuw nsw i64 %15, 1
  store i32 0, ptr %13, align 4
  %17 = load ptr, ptr %9, align 8
  %18 = getelementptr inbounds i32, ptr %17, i64 %16
  %19 = load i32, ptr %18, align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %51, label %21

21:                                               ; preds = %12
  %22 = load ptr, ptr %8, align 8
  %23 = load i32, ptr %7, align 4
  %24 = sext i32 %23 to i64
  %25 = add nsw i64 %24, %16
  %26 = getelementptr inbounds i32, ptr %22, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %51, label %29

29:                                               ; preds = %21
  %30 = load ptr, ptr %10, align 8
  %31 = trunc i64 %16 to i32
  %32 = sub nsw i32 %23, %31
  %33 = add nsw i32 %32, 7
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, ptr %30, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %51, label %38

38:                                               ; preds = %29
  %39 = load ptr, ptr %11, align 8
  %40 = sext i32 %23 to i64
  %41 = getelementptr inbounds i32, ptr %39, i64 %40
  %42 = trunc i64 %16 to i32
  store i32 %42, ptr %41, align 4
  store i32 0, ptr %18, align 4
  store i32 0, ptr %26, align 4
  store i32 0, ptr %35, align 4
  %43 = icmp slt i32 %23, 8
  br i1 %43, label %44, label %50

44:                                               ; preds = %38
  %45 = add nsw i32 %23, 1
  call void @Try(i32 noundef %45, ptr noundef %1, ptr noundef %22, ptr noundef %17, ptr noundef %30, ptr noundef %39)
  %46 = load i32, ptr %1, align 4
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %51

48:                                               ; preds = %44
  store i32 1, ptr %18, align 4
  store i32 1, ptr %26, align 4
  store i32 1, ptr %35, align 4
  %49 = load i32, ptr %1, align 4
  br label %51

50:                                               ; preds = %38
  store i32 1, ptr %14, align 4
  br label %51

51:                                               ; preds = %50, %48, %44, %29, %21, %12
  %52 = phi i32 [ 1, %50 ], [ %49, %48 ], [ %46, %44 ], [ 0, %29 ], [ 0, %21 ], [ 0, %12 ]
  %53 = phi ptr [ %14, %50 ], [ %1, %48 ], [ %1, %44 ], [ %14, %29 ], [ %14, %21 ], [ %14, %12 ]
  %54 = phi ptr [ %14, %50 ], [ %1, %48 ], [ %1, %44 ], [ %13, %29 ], [ %13, %21 ], [ %13, %12 ]
  %55 = icmp eq i32 %52, 0
  %56 = icmp ne i64 %16, 8
  %57 = select i1 %55, i1 %56, i1 false
  br i1 %57, label %12, label %58, !llvm.loop !6

58:                                               ; preds = %51
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Doit() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = alloca [9 x i32], align 16
  %3 = alloca [17 x i32], align 16
  %4 = alloca [15 x i32], align 16
  %5 = alloca [9 x i32], align 16
  br label %6

6:                                                ; preds = %0, %23
  %7 = phi i64 [ -7, %0 ], [ %24, %23 ]
  %8 = icmp sgt i64 %7, 0
  %9 = icmp slt i64 %7, 9
  %10 = select i1 %8, i1 %9, i1 false
  br i1 %10, label %11, label %13

11:                                               ; preds = %6
  %12 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %7
  store i32 1, ptr %12, align 4
  br label %13

13:                                               ; preds = %11, %6
  %14 = icmp sgt i64 %7, 1
  br i1 %14, label %15, label %17

15:                                               ; preds = %13
  %16 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %7
  store i32 1, ptr %16, align 4
  br label %18

17:                                               ; preds = %13
  br label %18

18:                                               ; preds = %17, %15
  %19 = icmp slt i64 %7, 8
  br i1 %19, label %20, label %23

20:                                               ; preds = %18
  %21 = add nsw i64 %7, 7
  %22 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %21
  store i32 1, ptr %22, align 4
  br label %23

23:                                               ; preds = %20, %18
  %24 = add nsw i64 %7, 1
  %25 = icmp ne i64 %24, 17
  br i1 %25, label %6, label %26, !llvm.loop !8

26:                                               ; preds = %23
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %27 = load i32, ptr %1, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %26
  %30 = call i32 @puts(ptr nonnull dereferenceable(1) @1)
  br label %31

31:                                               ; preds = %29, %26
  ret void
}

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %1, %2
  %3 = phi i32 [ 1, %1 ], [ %4, %2 ]
  call void @Doit()
  %4 = add nuw nsw i32 %3, 1
  %5 = icmp ne i32 %4, 51
  br i1 %5, label %2, label %6, !llvm.loop !9

6:                                                ; preds = %2
  %7 = add nsw i32 %0, 1
  %8 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %7) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i32 [ 0, %0 ], [ %3, %1 ]
  call void @Queens(i32 noundef %2)
  %3 = add nuw nsw i32 %2, 1
  %4 = icmp ne i32 %3, 100
  br i1 %4, label %1, label %5, !llvm.loop !10

5:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #2

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
