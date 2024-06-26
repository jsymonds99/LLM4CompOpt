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
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %0)
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
  %1 = load i32, ptr @freelist, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %8

3:                                                ; preds = %0
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %4
  %6 = getelementptr inbounds %struct.element, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr @freelist, align 4
  br label %9

8:                                                ; preds = %0
  tail call void @Error(ptr noundef @.str.1)
  br label %9

9:                                                ; preds = %8, %3
  %10 = phi i32 [ 0, %8 ], [ %1, %3 ]
  ret i32 %10
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Push(i32 noundef %0, i32 noundef %1) #0 {
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %3
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %15

7:                                                ; preds = %2
  %8 = sext i32 %5 to i64
  %9 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %8
  %10 = load i32, ptr %9, align 8
  %11 = icmp sle i32 %10, %0
  br i1 %11, label %12, label %13

12:                                               ; preds = %7
  tail call void @Error(ptr noundef @.str.2)
  br label %13

13:                                               ; preds = %12, %7
  %14 = phi i32 [ 1, %12 ], [ 0, %7 ]
  br label %15

15:                                               ; preds = %13, %2
  %16 = phi i32 [ %14, %13 ], [ 0, %2 ]
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %24, label %18

18:                                               ; preds = %15
  %19 = tail call i32 @Getelement()
  %20 = load i32, ptr %4, align 4
  %21 = sext i32 %19 to i64
  %22 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.element, ptr %22, i32 0, i32 1
  store i32 %20, ptr %23, align 4
  store i32 %19, ptr %4, align 4
  store i32 %0, ptr %22, align 8
  br label %24

24:                                               ; preds = %18, %15
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Init(i32 noundef %0, i32 noundef %1) #0 {
  tail call void @Makenull(i32 noundef %0)
  br label %3

3:                                                ; preds = %6, %2
  %4 = phi i32 [ %7, %6 ], [ %1, %2 ]
  %5 = icmp sge i32 %4, 1
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  tail call void @Push(i32 noundef %4, i32 noundef %0)
  %7 = add nsw i32 %4, -1
  br label %3, !llvm.loop !6

8:                                                ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Pop(i32 noundef %0) #0 {
  %2 = sext i32 %0 to i64
  %3 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %2
  %4 = load i32, ptr %3, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %13

6:                                                ; preds = %1
  %7 = sext i32 %4 to i64
  %8 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %7
  %9 = load i32, ptr %8, align 8
  %10 = getelementptr inbounds %struct.element, ptr %8, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = load i32, ptr @freelist, align 4
  store i32 %12, ptr %10, align 4
  store i32 %4, ptr @freelist, align 4
  store i32 %11, ptr %3, align 4
  br label %14

13:                                               ; preds = %1
  tail call void @Error(ptr noundef @.str.3)
  br label %14

14:                                               ; preds = %13, %6
  %15 = phi i32 [ 0, %13 ], [ %9, %6 ]
  ret i32 %15
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Move(i32 noundef %0, i32 noundef %1) #0 {
  %3 = tail call i32 @Pop(i32 noundef %0)
  tail call void @Push(i32 noundef %3, i32 noundef %1)
  %4 = load i32, ptr @movesdone, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, ptr @movesdone, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @tower(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %6, %3
  %.tr = phi i32 [ %0, %3 ], [ %8, %6 ]
  %.tr2 = phi i32 [ %2, %3 ], [ %9, %6 ]
  %4 = icmp eq i32 %.tr2, 1
  br i1 %4, label %5, label %6

5:                                                ; preds = %tailrecurse
  tail call void @Move(i32 noundef %.tr, i32 noundef %1)
  br label %10

6:                                                ; preds = %tailrecurse
  %7 = sub nsw i32 6, %.tr
  %8 = sub nsw i32 %7, %1
  %9 = sub nsw i32 %.tr2, 1
  tail call void @tower(i32 noundef %.tr, i32 noundef %8, i32 noundef %9)
  tail call void @Move(i32 noundef %.tr, i32 noundef %1)
  br label %tailrecurse

10:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Towers() #0 {
  br label %1

1:                                                ; preds = %4, %0
  %2 = phi i32 [ %9, %4 ], [ 1, %0 ]
  %3 = icmp sle i32 %2, 18
  br i1 %3, label %4, label %10

4:                                                ; preds = %1
  %5 = sub nsw i32 %2, 1
  %6 = sext i32 %2 to i64
  %7 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.element, ptr %7, i32 0, i32 1
  store i32 %5, ptr %8, align 4
  %9 = add nsw i32 %2, 1
  br label %1, !llvm.loop !8

10:                                               ; preds = %1
  store i32 18, ptr @freelist, align 4
  tail call void @Init(i32 noundef 1, i32 noundef 14)
  tail call void @Makenull(i32 noundef 2)
  tail call void @Makenull(i32 noundef 3)
  store i32 0, ptr @movesdone, align 4
  tail call void @tower(i32 noundef 1, i32 noundef 2, i32 noundef 14)
  %11 = load i32, ptr @movesdone, align 4
  %12 = icmp ne i32 %11, 16383
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %.pre = load i32, ptr @movesdone, align 4
  br label %15

15:                                               ; preds = %13, %10
  %16 = phi i32 [ %.pre, %13 ], [ 16383, %10 ]
  %17 = tail call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %16)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %4, %0
  %2 = phi i32 [ %5, %4 ], [ 0, %0 ]
  %3 = icmp slt i32 %2, 100
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  tail call void @Towers()
  %5 = add nsw i32 %2, 1
  br label %1, !llvm.loop !9

6:                                                ; preds = %1
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
