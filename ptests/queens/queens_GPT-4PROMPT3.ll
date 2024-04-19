; ModuleID = 'queens_unoptimized.ll'
source_filename = "queens.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local local_unnamed_addr global i64 0, align 8
@.str = private unnamed_addr constant [19 x i8] c" Error in Queens.\0A\00", align 1
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
  %5 = load i64, ptr @seed, align 8
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Try(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) local_unnamed_addr #0 {
  store i32 0, ptr %1, align 4
  br label %7

7:                                                ; preds = %58, %6
  %.0 = phi i32 [ 0, %6 ], [ %12, %58 ]
  %8 = load i32, ptr %1, align 4
  %9 = icmp ne i32 %8, 0
  %10 = icmp ne i32 %.0, 8
  %spec.select = select i1 %9, i1 false, i1 %10
  br i1 %spec.select, label %11, label %59

11:                                               ; preds = %7
  %12 = add nsw i32 %.0, 1
  store i32 0, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %3, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %58

17:                                               ; preds = %11
  %18 = add nsw i32 %0, %12
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, ptr %2, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %58

23:                                               ; preds = %17
  %24 = sub nsw i32 %0, %12
  %25 = add nsw i32 %24, 7
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr %4, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %58

30:                                               ; preds = %23
  %31 = sext i32 %0 to i64
  %32 = getelementptr inbounds i32, ptr %5, i64 %31
  store i32 %12, ptr %32, align 4
  %33 = sext i32 %12 to i64
  %34 = getelementptr inbounds i32, ptr %3, i64 %33
  store i32 0, ptr %34, align 4
  %35 = add nsw i32 %0, %12
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, ptr %2, i64 %36
  store i32 0, ptr %37, align 4
  %38 = sub nsw i32 %0, %12
  %39 = add nsw i32 %38, 7
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %4, i64 %40
  store i32 0, ptr %41, align 4
  %42 = icmp slt i32 %0, 8
  br i1 %42, label %43, label %57

43:                                               ; preds = %30
  %44 = add nsw i32 %0, 1
  call void @Try(i32 noundef %44, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %45 = load i32, ptr %1, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %58, label %47

47:                                               ; preds = %43
  %48 = sext i32 %12 to i64
  %49 = getelementptr inbounds i32, ptr %3, i64 %48
  store i32 1, ptr %49, align 4
  %50 = add nsw i32 %0, %12
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr %2, i64 %51
  store i32 1, ptr %52, align 4
  %53 = sub nsw i32 %0, %12
  %54 = add nsw i32 %53, 7
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, ptr %4, i64 %55
  store i32 1, ptr %56, align 4
  br label %58

57:                                               ; preds = %30
  store i32 1, ptr %1, align 4
  br label %58

58:                                               ; preds = %57, %47, %43, %23, %17, %11
  br label %7, !llvm.loop !6

59:                                               ; preds = %7
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

6:                                                ; preds = %25, %0
  %.0 = phi i32 [ -7, %0 ], [ %26, %25 ]
  %7 = icmp sle i32 %.0, 16
  br i1 %7, label %8, label %27

8:                                                ; preds = %6
  %9 = icmp sge i32 %.0, 1
  %10 = icmp sle i32 %.0, 8
  %or.cond = and i1 %9, %10
  br i1 %or.cond, label %11, label %14

11:                                               ; preds = %8
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %12
  store i32 1, ptr %13, align 4
  br label %14

14:                                               ; preds = %11, %8
  %15 = icmp sge i32 %.0, 2
  br i1 %15, label %16, label %19

16:                                               ; preds = %14
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %17
  store i32 1, ptr %18, align 4
  br label %19

19:                                               ; preds = %16, %14
  %20 = icmp sle i32 %.0, 7
  br i1 %20, label %21, label %25

21:                                               ; preds = %19
  %22 = add nsw i32 %.0, 7
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %23
  store i32 1, ptr %24, align 4
  br label %25

25:                                               ; preds = %21, %19
  %26 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !8

27:                                               ; preds = %6
  %28 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 0
  %29 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 0
  %30 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 0
  %31 = getelementptr inbounds [9 x i32], ptr %5, i64 0, i64 0
  call void @Try(i32 noundef 1, ptr noundef %1, ptr noundef %28, ptr noundef %29, ptr noundef %30, ptr noundef %31)
  %32 = load i32, ptr %1, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %36, label %34

34:                                               ; preds = %27
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %36

36:                                               ; preds = %34, %27
  ret void
}

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %4, %1
  %.0 = phi i32 [ 1, %1 ], [ %5, %4 ]
  %3 = icmp sle i32 %.0, 50
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  call void @Doit()
  %5 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

6:                                                ; preds = %2
  %7 = add nsw i32 %0, 1
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %7)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %3, %0
  %.0 = phi i32 [ 0, %0 ], [ %4, %3 ]
  %2 = icmp slt i32 %.0, 100
  br i1 %2, label %3, label %5

3:                                                ; preds = %1
  call void @Queens(i32 noundef %.0)
  %4 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !10

5:                                                ; preds = %1
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
