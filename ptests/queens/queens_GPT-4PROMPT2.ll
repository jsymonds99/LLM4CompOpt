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
  %5 = load i64, ptr @seed, align 8
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Try(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store i32 0, ptr %13, align 4
  %14 = load ptr, ptr %8, align 8
  store i32 0, ptr %14, align 4
  br label %15

15:                                               ; preds = %107, %6
  %16 = load ptr, ptr %8, align 8
  %17 = load i32, ptr %16, align 4
  %18 = icmp ne i32 %17, 0
  %19 = load i32, ptr %13, align 4
  %20 = icmp ne i32 %19, 8
  %21 = select i1 %18, i1 false, i1 %20
  br i1 %21, label %22, label %108

22:                                               ; preds = %15
  %23 = load i32, ptr %13, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %13, align 4
  %25 = load ptr, ptr %8, align 8
  store i32 0, ptr %25, align 4
  %26 = load ptr, ptr %10, align 8
  %27 = load i32, ptr %13, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr %26, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %107

32:                                               ; preds = %22
  %33 = load ptr, ptr %9, align 8
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr %13, align 4
  %36 = add nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %33, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %107

41:                                               ; preds = %32
  %42 = load ptr, ptr %11, align 8
  %43 = load i32, ptr %7, align 4
  %44 = load i32, ptr %13, align 4
  %45 = sub nsw i32 %43, %44
  %46 = add nsw i32 %45, 7
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %42, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %107

51:                                               ; preds = %41
  %52 = load i32, ptr %13, align 4
  %53 = load ptr, ptr %12, align 8
  %54 = load i32, ptr %7, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, ptr %53, i64 %55
  store i32 %52, ptr %56, align 4
  %57 = load ptr, ptr %10, align 8
  %58 = load i32, ptr %13, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %57, i64 %59
  store i32 0, ptr %60, align 4
  %61 = load ptr, ptr %9, align 8
  %62 = load i32, ptr %7, align 4
  %63 = load i32, ptr %13, align 4
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr %61, i64 %65
  store i32 0, ptr %66, align 4
  %67 = load ptr, ptr %11, align 8
  %68 = load i32, ptr %7, align 4
  %69 = load i32, ptr %13, align 4
  %70 = sub nsw i32 %68, %69
  %71 = add nsw i32 %70, 7
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, ptr %67, i64 %72
  store i32 0, ptr %73, align 4
  %74 = load i32, ptr %7, align 4
  %75 = icmp slt i32 %74, 8
  br i1 %75, label %76, label %105

76:                                               ; preds = %51
  %77 = load i32, ptr %7, align 4
  %78 = add nsw i32 %77, 1
  %79 = load ptr, ptr %8, align 8
  %80 = load ptr, ptr %9, align 8
  %81 = load ptr, ptr %10, align 8
  %82 = load ptr, ptr %11, align 8
  %83 = load ptr, ptr %12, align 8
  call void @Try(i32 noundef %78, ptr noundef %79, ptr noundef %80, ptr noundef %81, ptr noundef %82, ptr noundef %83)
  %84 = load ptr, ptr %8, align 8
  %85 = load i32, ptr %84, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %107, label %87

87:                                               ; preds = %76
  %88 = load ptr, ptr %10, align 8
  %89 = load i32, ptr %13, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, ptr %88, i64 %90
  store i32 1, ptr %91, align 4
  %92 = load ptr, ptr %9, align 8
  %93 = load i32, ptr %7, align 4
  %94 = load i32, ptr %13, align 4
  %95 = add nsw i32 %93, %94
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, ptr %92, i64 %96
  store i32 1, ptr %97, align 4
  %98 = load ptr, ptr %11, align 8
  %99 = load i32, ptr %7, align 4
  %100 = load i32, ptr %13, align 4
  %101 = sub nsw i32 %99, %100
  %102 = add nsw i32 %101, 7
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, ptr %98, i64 %103
  store i32 1, ptr %104, align 4
  br label %107

105:                                              ; preds = %51
  %106 = load ptr, ptr %8, align 8
  store i32 1, ptr %106, align 4
  br label %107

107:                                              ; preds = %105, %87, %76, %41, %32, %22
  br label %15, !llvm.loop !6

108:                                              ; preds = %15
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Doit() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [9 x i32], align 16
  %4 = alloca [17 x i32], align 16
  %5 = alloca [15 x i32], align 16
  %6 = alloca [9 x i32], align 16
  store i32 -7, ptr %1, align 4
  br label %7

7:                                                ; preds = %34, %0
  %8 = load i32, ptr %1, align 4
  %9 = icmp sle i32 %8, 16
  br i1 %9, label %10, label %37

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  %12 = icmp sge i32 %11, 1
  %13 = load i32, ptr %1, align 4
  %14 = icmp sle i32 %13, 8
  %or.cond = select i1 %12, i1 %14, i1 false
  br i1 %or.cond, label %15, label %19

15:                                               ; preds = %10
  %16 = load i32, ptr %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [9 x i32], ptr %3, i64 0, i64 %17
  store i32 1, ptr %18, align 4
  br label %19

19:                                               ; preds = %15, %10
  %20 = load i32, ptr %1, align 4
  %21 = icmp sge i32 %20, 2
  br i1 %21, label %22, label %26

22:                                               ; preds = %19
  %23 = load i32, ptr %1, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [17 x i32], ptr %4, i64 0, i64 %24
  store i32 1, ptr %25, align 4
  br label %26

26:                                               ; preds = %22, %19
  %27 = load i32, ptr %1, align 4
  %28 = icmp sle i32 %27, 7
  br i1 %28, label %29, label %34

29:                                               ; preds = %26
  %30 = load i32, ptr %1, align 4
  %31 = add nsw i32 %30, 7
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [15 x i32], ptr %5, i64 0, i64 %32
  store i32 1, ptr %33, align 4
  br label %34

34:                                               ; preds = %29, %26
  %35 = load i32, ptr %1, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %1, align 4
  br label %7, !llvm.loop !8

37:                                               ; preds = %7
  %38 = getelementptr inbounds [17 x i32], ptr %4, i64 0, i64 0
  %39 = getelementptr inbounds [9 x i32], ptr %3, i64 0, i64 0
  %40 = getelementptr inbounds [15 x i32], ptr %5, i64 0, i64 0
  %41 = getelementptr inbounds [9 x i32], ptr %6, i64 0, i64 0
  call void @Try(i32 noundef 1, ptr noundef %2, ptr noundef %38, ptr noundef %39, ptr noundef %40, ptr noundef %41)
  %42 = load i32, ptr %2, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %46, label %44

44:                                               ; preds = %37
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %46

46:                                               ; preds = %44, %37
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  br label %4

4:                                                ; preds = %7, %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp sle i32 %5, 50
  br i1 %6, label %7, label %10

7:                                                ; preds = %4
  call void @Doit()
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %3, align 4
  br label %4, !llvm.loop !9

10:                                               ; preds = %4
  %11 = load i32, ptr %2, align 4
  %12 = add nsw i32 %11, 1
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %12)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %3

3:                                                ; preds = %6, %0
  %4 = load i32, ptr %2, align 4
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %10

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4
  call void @Queens(i32 noundef %7)
  %8 = load i32, ptr %2, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %2, align 4
  br label %3, !llvm.loop !10

10:                                               ; preds = %3
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
