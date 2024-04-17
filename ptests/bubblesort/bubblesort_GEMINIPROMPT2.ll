; ModuleID = 'bubblesort_unoptimized.ll'
source_filename = "bubblesort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local global i64 0, align 8
@biggest = dso_local global i32 0, align 4
@littlest = dso_local global i32 0, align 4
@sortlist = dso_local global [5001 x i32] zeroinitializer, align 16
@top = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"Error3 in Bubble.\0A\00", align 1
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
@z = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@w = dso_local global [257 x %struct.complex] zeroinitializer, align 16
@e = dso_local global [130 x %struct.complex] zeroinitializer, align 16
@zr = dso_local global float 0.000000e+00, align 4
@zi = dso_local global float 0.000000e+00, align 4
@str = private unnamed_addr constant [18 x i8] c"Error3 in Bubble.\00", align 1

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
define dso_local void @bInitarr() #0 {
  %1 = alloca i32, align 4
  call void @Initrand()
  store i32 0, ptr @biggest, align 4
  store i32 0, ptr @littlest, align 4
  br label %2

2:                                                ; preds = %37, %0
  %storemerge = phi i32 [ 1, %0 ], [ %39, %37 ]
  store i32 %storemerge, ptr %1, align 4
  %3 = icmp slt i32 %storemerge, 501
  br i1 %3, label %4, label %40

4:                                                ; preds = %2
  %5 = call i32 @Rand()
  %.fr1 = freeze i32 %5
  %6 = sext i32 %.fr1 to i64
  %7 = srem i64 %6, 100000
  %8 = trunc i64 %7 to i32
  %9 = add nsw i32 %8, -50000
  %10 = load i32, ptr %1, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %11
  store i32 %9, ptr %12, align 4
  %13 = sext i32 %10 to i64
  %14 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr @biggest, align 4
  %17 = icmp sgt i32 %15, %16
  br i1 %17, label %18, label %23

18:                                               ; preds = %4
  %19 = load i32, ptr %1, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  store i32 %22, ptr @biggest, align 4
  br label %36

23:                                               ; preds = %4
  %24 = load i32, ptr %1, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = load i32, ptr @littlest, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %35

30:                                               ; preds = %23
  %31 = load i32, ptr %1, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  store i32 %34, ptr @littlest, align 4
  br label %35

35:                                               ; preds = %30, %23
  br label %36

36:                                               ; preds = %35, %18
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %1, align 4
  %39 = add nsw i32 %38, 1
  br label %2, !llvm.loop !6

40:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Bubble(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @bInitarr()
  br label %5

5:                                                ; preds = %40, %1
  %storemerge = phi i32 [ 500, %1 ], [ %42, %40 ]
  store i32 %storemerge, ptr @top, align 4
  %6 = icmp sgt i32 %storemerge, 1
  br i1 %6, label %7, label %43

7:                                                ; preds = %5
  br label %8

8:                                                ; preds = %37, %7
  %storemerge2 = phi i32 [ 1, %7 ], [ %39, %37 ]
  store i32 %storemerge2, ptr %3, align 4
  %9 = load i32, ptr @top, align 4
  %10 = icmp slt i32 %storemerge2, %9
  br i1 %10, label %11, label %40

11:                                               ; preds = %8
  %12 = load i32, ptr %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %12, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = icmp sgt i32 %15, %19
  br i1 %20, label %21, label %37

21:                                               ; preds = %11
  %22 = load i32, ptr %3, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %23
  %25 = load i32, ptr %24, align 4
  store i32 %25, ptr %4, align 4
  %26 = add nsw i32 %22, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = load i32, ptr %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %31
  store i32 %29, ptr %32, align 4
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %30, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %35
  store i32 %33, ptr %36, align 4
  br label %37

37:                                               ; preds = %21, %11
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %38, 1
  br label %8, !llvm.loop !8

40:                                               ; preds = %8
  %41 = load i32, ptr @top, align 4
  %42 = add nsw i32 %41, -1
  br label %5, !llvm.loop !9

43:                                               ; preds = %5
  %44 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4
  %45 = load i32, ptr @littlest, align 4
  %.not = icmp eq i32 %44, %45
  br i1 %.not, label %46, label %49

46:                                               ; preds = %43
  %47 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 500), align 16
  %48 = load i32, ptr @biggest, align 4
  %.not1 = icmp eq i32 %47, %48
  br i1 %.not1, label %50, label %49

49:                                               ; preds = %46, %43
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %50

50:                                               ; preds = %49, %46
  %51 = load i32, ptr %2, align 4
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %55) #3
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %6, %0
  %storemerge = phi i32 [ 0, %0 ], [ %8, %6 ]
  store i32 %storemerge, ptr %1, align 4
  %3 = icmp slt i32 %storemerge, 100
  br i1 %3, label %4, label %9

4:                                                ; preds = %2
  %5 = load i32, ptr %1, align 4
  call void @Bubble(i32 noundef %5)
  br label %6

6:                                                ; preds = %4
  %7 = load i32, ptr %1, align 4
  %8 = add nsw i32 %7, 1
  br label %2, !llvm.loop !10

9:                                                ; preds = %2
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
