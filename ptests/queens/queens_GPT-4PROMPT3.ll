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

7:                                                ; preds = %37, %6
  %8 = phi i32 [ %13, %37 ], [ 0, %6 ]
  %9 = phi i32 [ %.pre, %37 ], [ 0, %6 ]
  %.not = icmp eq i32 %9, 0
  %10 = icmp ne i32 %8, 8
  %11 = and i1 %.not, %10
  br i1 %11, label %12, label %38

12:                                               ; preds = %7
  %13 = add nuw nsw i32 %8, 1
  store i32 0, ptr %1, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %3, i64 %14
  %16 = load i32, ptr %15, align 4
  %.not2 = icmp eq i32 %16, 0
  br i1 %.not2, label %37, label %17

17:                                               ; preds = %12
  %18 = add nsw i32 %13, %0
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, ptr %2, i64 %19
  %21 = load i32, ptr %20, align 4
  %.not3 = icmp eq i32 %21, 0
  br i1 %.not3, label %37, label %22

22:                                               ; preds = %17
  %23 = sub nsw i32 %0, %13
  %24 = add nsw i32 %23, 7
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %4, i64 %25
  %27 = load i32, ptr %26, align 4
  %.not4 = icmp eq i32 %27, 0
  br i1 %.not4, label %37, label %28

28:                                               ; preds = %22
  %29 = sext i32 %0 to i64
  %30 = getelementptr inbounds i32, ptr %5, i64 %29
  store i32 %13, ptr %30, align 4
  store i32 0, ptr %15, align 4
  store i32 0, ptr %20, align 4
  store i32 0, ptr %26, align 4
  %31 = icmp slt i32 %0, 8
  br i1 %31, label %32, label %36

32:                                               ; preds = %28
  %33 = add nsw i32 %0, 1
  call void @Try(i32 noundef %33, ptr noundef nonnull %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %34 = load i32, ptr %1, align 4
  %.not5 = icmp eq i32 %34, 0
  br i1 %.not5, label %35, label %37

35:                                               ; preds = %32
  store i32 1, ptr %15, align 4
  store i32 1, ptr %20, align 4
  store i32 1, ptr %26, align 4
  %.pre.pre = load i32, ptr %1, align 4
  br label %37

36:                                               ; preds = %28
  store i32 1, ptr %1, align 4
  br label %37

37:                                               ; preds = %36, %35, %32, %22, %17, %12
  %.pre = phi i32 [ 1, %36 ], [ %.pre.pre, %35 ], [ %34, %32 ], [ 0, %22 ], [ 0, %17 ], [ 0, %12 ]
  br label %7, !llvm.loop !6

38:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Doit() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [9 x i32], align 16
  %3 = alloca [17 x i32], align 16
  %4 = alloca [15 x i32], align 16
  %5 = alloca [9 x i32], align 16
  br label %6

6:                                                ; preds = %25, %0
  %7 = phi i32 [ %26, %25 ], [ -7, %0 ]
  %8 = icmp slt i32 %7, 17
  br i1 %8, label %9, label %27

9:                                                ; preds = %6
  %10 = add i32 %7, -1
  %or.cond = icmp ult i32 %10, 8
  br i1 %or.cond, label %11, label %14

11:                                               ; preds = %9
  %12 = sext i32 %7 to i64
  %13 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %12
  store i32 1, ptr %13, align 4
  br label %14

14:                                               ; preds = %11, %9
  %15 = icmp sgt i32 %7, 1
  br i1 %15, label %16, label %19

16:                                               ; preds = %14
  %17 = sext i32 %7 to i64
  %18 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %17
  store i32 1, ptr %18, align 4
  br label %19

19:                                               ; preds = %16, %14
  %20 = icmp slt i32 %7, 8
  br i1 %20, label %21, label %25

21:                                               ; preds = %19
  %22 = add nsw i32 %7, 7
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %23
  store i32 1, ptr %24, align 4
  br label %25

25:                                               ; preds = %21, %19
  %26 = add nsw i32 %7, 1
  br label %6, !llvm.loop !8

27:                                               ; preds = %6
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %28 = load i32, ptr %1, align 4
  %.not = icmp eq i32 %28, 0
  br i1 %.not, label %29, label %30

29:                                               ; preds = %27
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %30

30:                                               ; preds = %29, %27
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %5, %1
  %3 = phi i32 [ %6, %5 ], [ 1, %1 ]
  %4 = icmp ult i32 %3, 51
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  call void @Doit()
  %6 = add nuw nsw i32 %3, 1
  br label %2, !llvm.loop !9

7:                                                ; preds = %2
  %8 = add nsw i32 %0, 1
  %9 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %8) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %4, %0
  %2 = phi i32 [ %5, %4 ], [ 0, %0 ]
  %3 = icmp ult i32 %2, 100
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  call void @Queens(i32 noundef %2)
  %5 = add nuw nsw i32 %2, 1
  br label %1, !llvm.loop !10

6:                                                ; preds = %1
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
