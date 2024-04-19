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

7:                                                ; preds = %49, %6
  %8 = phi ptr [ %50, %49 ], [ %1, %6 ]
  %9 = phi ptr [ %51, %49 ], [ %1, %6 ]
  %10 = phi i32 [ %18, %49 ], [ 0, %6 ]
  %11 = phi i32 [ %.pre, %49 ], [ 0, %6 ]
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %15, label %13

13:                                               ; preds = %7
  %14 = icmp ne i32 %10, 8
  br label %15

15:                                               ; preds = %13, %7
  %16 = phi i1 [ false, %7 ], [ %14, %13 ]
  br i1 %16, label %17, label %52

17:                                               ; preds = %15
  %18 = add nsw i32 %10, 1
  store i32 0, ptr %9, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, ptr %3, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %49

23:                                               ; preds = %17
  %24 = add nsw i32 %0, %18
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %2, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %49

29:                                               ; preds = %23
  %30 = sub nsw i32 %0, %18
  %31 = add nsw i32 %30, 7
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, ptr %4, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %49

36:                                               ; preds = %29
  %37 = sext i32 %0 to i64
  %38 = getelementptr inbounds i32, ptr %5, i64 %37
  store i32 %18, ptr %38, align 4
  store i32 0, ptr %20, align 4
  store i32 0, ptr %26, align 4
  store i32 0, ptr %33, align 4
  %39 = icmp slt i32 %0, 8
  br i1 %39, label %40, label %46

40:                                               ; preds = %36
  %41 = add nsw i32 %0, 1
  tail call void @Try(i32 noundef %41, ptr noundef %8, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %42 = load i32, ptr %1, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %45, label %44

44:                                               ; preds = %40
  store i32 1, ptr %20, align 4
  store i32 1, ptr %26, align 4
  store i32 1, ptr %33, align 4
  %.pre.pre.pre.pre = load i32, ptr %1, align 4
  br label %45

45:                                               ; preds = %44, %40
  %.pre.pre.pre = phi i32 [ %.pre.pre.pre.pre, %44 ], [ %42, %40 ]
  br label %47

46:                                               ; preds = %36
  store i32 1, ptr %8, align 4
  br label %47

47:                                               ; preds = %46, %45
  %.pre.pre = phi i32 [ 1, %46 ], [ %.pre.pre.pre, %45 ]
  %48 = phi ptr [ %8, %46 ], [ %1, %45 ]
  br label %49

49:                                               ; preds = %47, %29, %23, %17
  %.pre = phi i32 [ %.pre.pre, %47 ], [ 0, %29 ], [ 0, %23 ], [ 0, %17 ]
  %50 = phi ptr [ %48, %47 ], [ %8, %29 ], [ %8, %23 ], [ %8, %17 ]
  %51 = phi ptr [ %48, %47 ], [ %9, %29 ], [ %9, %23 ], [ %9, %17 ]
  br label %7, !llvm.loop !6

52:                                               ; preds = %15
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

6:                                                ; preds = %0, %25
  %7 = phi i32 [ -7, %0 ], [ %26, %25 ]
  %8 = icmp sge i32 %7, 1
  br i1 %8, label %9, label %14

9:                                                ; preds = %6
  %10 = icmp sle i32 %7, 8
  br i1 %10, label %11, label %14

11:                                               ; preds = %9
  %12 = sext i32 %7 to i64
  %13 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %12
  store i32 1, ptr %13, align 4
  br label %14

14:                                               ; preds = %11, %9, %6
  %15 = icmp sge i32 %7, 2
  br i1 %15, label %16, label %19

16:                                               ; preds = %14
  %17 = sext i32 %7 to i64
  %18 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %17
  store i32 1, ptr %18, align 4
  br label %19

19:                                               ; preds = %16, %14
  %20 = icmp sle i32 %7, 7
  br i1 %20, label %21, label %25

21:                                               ; preds = %19
  %22 = add nsw i32 %7, 7
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %23
  store i32 1, ptr %24, align 4
  br label %25

25:                                               ; preds = %21, %19
  %26 = add nsw i32 %7, 1
  %27 = icmp sle i32 %26, 16
  br i1 %27, label %6, label %28, !llvm.loop !8

28:                                               ; preds = %25
  call void @Try(i32 noundef 1, ptr noundef %1, ptr noundef %3, ptr noundef %2, ptr noundef %4, ptr noundef %5)
  %29 = load i32, ptr %1, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %33, label %31

31:                                               ; preds = %28
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %33

33:                                               ; preds = %31, %28
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %1, %2
  %3 = phi i32 [ 1, %1 ], [ %4, %2 ]
  tail call void @Doit()
  %4 = add nsw i32 %3, 1
  %5 = icmp sle i32 %4, 50
  br i1 %5, label %2, label %6, !llvm.loop !9

6:                                                ; preds = %2
  %7 = add nsw i32 %0, 1
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %7)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i32 [ 0, %0 ], [ %3, %1 ]
  tail call void @Queens(i32 noundef %2)
  %3 = add nsw i32 %2, 1
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %1, label %5, !llvm.loop !10

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
