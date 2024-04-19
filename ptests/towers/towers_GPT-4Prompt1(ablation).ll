; ModuleID = 'towers_unoptimized.ll'
source_filename = "towers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [22 x i8] c" Error in Towers: %s\0A\00", align 1
@stack = dso_local global [4 x i32] zeroinitializer, align 16
@freelist = dso_local global i32 0, align 4
@cellspace = dso_local global [19 x %struct.element] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [16 x i8] c"out of space   \00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"disc size error\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"nothing to pop \00", align 1
@movesdone = dso_local global i32 0, align 4
@.str.4 = private unnamed_addr constant [19 x i8] c" Error in Towers.\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local global float 0.000000e+00, align 4
@fixed = dso_local global float 0.000000e+00, align 4
@floated = dso_local global float 0.000000e+00, align 4
@permarray = dso_local global [11 x i32] zeroinitializer, align 16
@pctr = dso_local global i32 0, align 4
@tree = dso_local global ptr null, align 8
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
@str = private unnamed_addr constant [18 x i8] c" Error in Towers.\00", align 1

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
define dso_local void @Error(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, ptr noundef %0) #3
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Makenull(i32 noundef %0) #0 {
  %2 = sext i32 %0 to i64
  %3 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %2
  store i32 0, ptr %3, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Getelement() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = load i32, ptr @freelist, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %0
  store i32 %2, ptr %1, align 4
  %5 = sext i32 %2 to i64
  %6 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %5, i32 1
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr @freelist, align 4
  br label %9

8:                                                ; preds = %0
  call void @Error(ptr noundef nonnull @.str.1)
  br label %9

9:                                                ; preds = %8, %4
  %10 = phi i32 [ 0, %8 ], [ %2, %4 ]
  ret i32 %10
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Push(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %7 = sext i32 %1 to i64
  %8 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %16

11:                                               ; preds = %2
  %12 = sext i32 %9 to i64
  %13 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %12
  %14 = load i32, ptr %13, align 8
  %.not1 = icmp sgt i32 %14, %0
  br i1 %.not1, label %16, label %15

15:                                               ; preds = %11
  store i32 1, ptr %5, align 4
  call void @Error(ptr noundef nonnull @.str.2)
  br label %22

16:                                               ; preds = %11, %2
  %17 = call i32 @Getelement()
  store i32 %17, ptr %6, align 4
  %18 = load i32, ptr %8, align 4
  %19 = sext i32 %17 to i64
  %20 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %19, i32 1
  store i32 %18, ptr %20, align 4
  store i32 %17, ptr %8, align 4
  %21 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %19
  store i32 %0, ptr %21, align 8
  br label %22

22:                                               ; preds = %15, %16
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Init(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @Makenull(i32 noundef %0)
  br label %5

5:                                                ; preds = %8, %2
  %6 = phi i32 [ %1, %2 ], [ %9, %8 ]
  store i32 %6, ptr %4, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %5
  call void @Push(i32 noundef %6, i32 noundef %0)
  %9 = add nsw i32 %6, -1
  br label %5, !llvm.loop !6

10:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Pop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %5 = sext i32 %0 to i64
  %6 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %5
  %7 = load i32, ptr %6, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %16

9:                                                ; preds = %1
  %10 = sext i32 %7 to i64
  %11 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %10
  %12 = load i32, ptr %11, align 8
  store i32 %12, ptr %4, align 4
  %13 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %10, i32 1
  %14 = load i32, ptr %13, align 4
  store i32 %14, ptr %3, align 4
  %15 = load i32, ptr @freelist, align 4
  store i32 %15, ptr %13, align 4
  store i32 %7, ptr @freelist, align 4
  store i32 %14, ptr %6, align 4
  br label %17

16:                                               ; preds = %1
  call void @Error(ptr noundef nonnull @.str.3)
  br label %17

17:                                               ; preds = %16, %9
  %storemerge = phi i32 [ 0, %16 ], [ %12, %9 ]
  ret i32 %storemerge
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Move(i32 noundef %0, i32 noundef %1) #0 {
  %3 = call i32 @Pop(i32 noundef %0)
  call void @Push(i32 noundef %3, i32 noundef %1)
  %4 = load i32, ptr @movesdone, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, ptr @movesdone, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @tower(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = icmp eq i32 %2, 1
  br i1 %8, label %9, label %10

9:                                                ; preds = %3
  call void @Move(i32 noundef %0, i32 noundef %1)
  br label %14

10:                                               ; preds = %3
  %11 = add i32 %0, %1
  %12 = sub i32 6, %11
  store i32 %12, ptr %7, align 4
  %13 = add nsw i32 %2, -1
  call void @tower(i32 noundef %0, i32 noundef %12, i32 noundef %13)
  call void @Move(i32 noundef %0, i32 noundef %1)
  call void @tower(i32 noundef %12, i32 noundef %1, i32 noundef %13)
  br label %14

14:                                               ; preds = %10, %9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Towers() #0 {
  %1 = alloca i32, align 4
  store i32 1, ptr %1, align 4
  store i32 0, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 1, i32 1), align 4
  store i32 2, ptr %1, align 4
  store i32 1, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 2, i32 1), align 4
  store i32 3, ptr %1, align 4
  store i32 2, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 3, i32 1), align 4
  store i32 4, ptr %1, align 4
  store i32 3, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 4, i32 1), align 4
  store i32 5, ptr %1, align 4
  store i32 4, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 5, i32 1), align 4
  store i32 6, ptr %1, align 4
  store i32 5, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 6, i32 1), align 4
  store i32 7, ptr %1, align 4
  store i32 6, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 7, i32 1), align 4
  store i32 8, ptr %1, align 4
  store i32 7, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 8, i32 1), align 4
  store i32 9, ptr %1, align 4
  store i32 8, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 9, i32 1), align 4
  store i32 10, ptr %1, align 4
  store i32 9, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 10, i32 1), align 4
  store i32 11, ptr %1, align 4
  store i32 10, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 11, i32 1), align 4
  store i32 12, ptr %1, align 4
  store i32 11, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 12, i32 1), align 4
  store i32 13, ptr %1, align 4
  store i32 12, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 13, i32 1), align 4
  store i32 14, ptr %1, align 4
  store i32 13, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 14, i32 1), align 4
  store i32 15, ptr %1, align 4
  store i32 14, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 15, i32 1), align 4
  store i32 16, ptr %1, align 4
  store i32 15, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 16, i32 1), align 4
  store i32 17, ptr %1, align 4
  store i32 16, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 17, i32 1), align 4
  store i32 18, ptr %1, align 4
  store i32 17, ptr getelementptr inbounds ([19 x %struct.element], ptr @cellspace, i64 0, i64 18, i32 1), align 4
  store i32 19, ptr %1, align 4
  store i32 18, ptr @freelist, align 4
  call void @Init(i32 noundef 1, i32 noundef 14)
  call void @Makenull(i32 noundef 2)
  call void @Makenull(i32 noundef 3)
  store i32 0, ptr @movesdone, align 4
  call void @tower(i32 noundef 1, i32 noundef 2, i32 noundef 14)
  %2 = load i32, ptr @movesdone, align 4
  %.not = icmp eq i32 %2, 16383
  br i1 %.not, label %4, label %3

3:                                                ; preds = %0
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %.pre = load i32, ptr @movesdone, align 4
  br label %4

4:                                                ; preds = %3, %0
  %5 = phi i32 [ %.pre, %3 ], [ 16383, %0 ]
  %6 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %5) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %5, %0
  %3 = phi i32 [ 0, %0 ], [ %6, %5 ]
  store i32 %3, ptr %1, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  call void @Towers()
  %6 = add nsw i32 %3, 1
  br label %2, !llvm.loop !8

7:                                                ; preds = %2
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
