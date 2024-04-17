; ModuleID = 'queens_unoptimized.ll'
source_filename = "queens.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local global i64 0, align 8
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

7:                                                ; preds = %58, %6
  %.0 = phi i32 [ 0, %6 ], [ %14, %58 ]
  %8 = load i32, ptr %1, align 4
  %.not = icmp eq i32 %8, 0
  br i1 %.not, label %9, label %11

9:                                                ; preds = %7
  %10 = icmp ne i32 %.0, 8
  br label %11

11:                                               ; preds = %9, %7
  %12 = phi i1 [ false, %7 ], [ %10, %9 ]
  br i1 %12, label %13, label %59

13:                                               ; preds = %11
  %14 = add nsw i32 %.0, 1
  store i32 0, ptr %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %3, i64 %15
  %17 = load i32, ptr %16, align 4
  %.not1 = icmp eq i32 %17, 0
  br i1 %.not1, label %58, label %18

18:                                               ; preds = %13
  %19 = add nsw i32 %0, %14
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %2, i64 %20
  %22 = load i32, ptr %21, align 4
  %.not2 = icmp eq i32 %22, 0
  br i1 %.not2, label %58, label %23

23:                                               ; preds = %18
  %24 = sub nsw i32 %0, %14
  %25 = add nsw i32 %24, 7
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr %4, i64 %26
  %28 = load i32, ptr %27, align 4
  %.not3 = icmp eq i32 %28, 0
  br i1 %.not3, label %58, label %29

29:                                               ; preds = %23
  %30 = sext i32 %0 to i64
  %31 = getelementptr inbounds i32, ptr %5, i64 %30
  store i32 %14, ptr %31, align 4
  %32 = sext i32 %14 to i64
  %33 = getelementptr inbounds i32, ptr %3, i64 %32
  store i32 0, ptr %33, align 4
  %34 = add nsw i32 %0, %14
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, ptr %2, i64 %35
  store i32 0, ptr %36, align 4
  %37 = sub nsw i32 %0, %14
  %38 = add nsw i32 %37, 7
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %4, i64 %39
  store i32 0, ptr %40, align 4
  %41 = icmp slt i32 %0, 8
  br i1 %41, label %42, label %56

42:                                               ; preds = %29
  %43 = add nsw i32 %0, 1
  call void @Try(i32 noundef %43, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %44 = load i32, ptr %1, align 4
  %.not4 = icmp eq i32 %44, 0
  br i1 %.not4, label %45, label %55

45:                                               ; preds = %42
  %46 = sext i32 %14 to i64
  %47 = getelementptr inbounds i32, ptr %3, i64 %46
  store i32 1, ptr %47, align 4
  %48 = add nsw i32 %0, %14
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, ptr %2, i64 %49
  store i32 1, ptr %50, align 4
  %51 = sub nsw i32 %0, %14
  %52 = add nsw i32 %51, 7
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, ptr %4, i64 %53
  store i32 1, ptr %54, align 4
  br label %55

55:                                               ; preds = %45, %42
  br label %57

56:                                               ; preds = %29
  store i32 1, ptr %1, align 4
  br label %57

57:                                               ; preds = %56, %55
  br label %58

58:                                               ; preds = %57, %23, %18, %13
  br label %7, !llvm.loop !6

59:                                               ; preds = %11
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

6:                                                ; preds = %26, %0
  %storemerge = phi i32 [ -7, %0 ], [ %27, %26 ]
  %7 = icmp slt i32 %storemerge, 17
  br i1 %7, label %8, label %28

8:                                                ; preds = %6
  %9 = icmp sgt i32 %storemerge, 0
  br i1 %9, label %10, label %15

10:                                               ; preds = %8
  %11 = icmp slt i32 %storemerge, 9
  br i1 %11, label %12, label %15

12:                                               ; preds = %10
  %13 = sext i32 %storemerge to i64
  %14 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %13
  store i32 1, ptr %14, align 4
  br label %15

15:                                               ; preds = %12, %10, %8
  %16 = icmp sgt i32 %storemerge, 1
  br i1 %16, label %17, label %20

17:                                               ; preds = %15
  %18 = sext i32 %storemerge to i64
  %19 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %18
  store i32 1, ptr %19, align 4
  br label %20

20:                                               ; preds = %17, %15
  %21 = icmp slt i32 %storemerge, 8
  br i1 %21, label %22, label %26

22:                                               ; preds = %20
  %23 = add nsw i32 %storemerge, 7
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %24
  store i32 1, ptr %25, align 4
  br label %26

26:                                               ; preds = %22, %20
  %27 = add nsw i32 %storemerge, 1
  br label %6, !llvm.loop !8

28:                                               ; preds = %6
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %29 = load i32, ptr %1, align 4
  %.not = icmp eq i32 %29, 0
  br i1 %.not, label %30, label %31

30:                                               ; preds = %28
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %31

31:                                               ; preds = %30, %28
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %5, %1
  %storemerge = phi i32 [ 1, %1 ], [ %6, %5 ]
  %3 = icmp slt i32 %storemerge, 51
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  call void @Doit()
  br label %5

5:                                                ; preds = %4
  %6 = add nsw i32 %storemerge, 1
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
  %storemerge = phi i32 [ 0, %0 ], [ %5, %4 ]
  %2 = icmp slt i32 %storemerge, 100
  br i1 %2, label %3, label %6

3:                                                ; preds = %1
  call void @Queens(i32 noundef %storemerge)
  br label %4

4:                                                ; preds = %3
  %5 = add nsw i32 %storemerge, 1
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
