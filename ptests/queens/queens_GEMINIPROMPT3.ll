; ModuleID = 'queens_unoptimized.ll'
source_filename = "queens.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i32 }
%1 = type { float, float }

@seed = dso_local global i64 0, align 8
@0 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = dso_local global float 0.000000e+00, align 4
@fixed = dso_local global float 0.000000e+00, align 4
@floated = dso_local global float 0.000000e+00, align 4
@permarray = dso_local global [11 x i32] zeroinitializer, align 16
@pctr = dso_local global i32 0, align 4
@tree = dso_local global ptr null, align 8
@stack = dso_local global [4 x i32] zeroinitializer, align 16
@cellspace = dso_local global [19 x %0] zeroinitializer, align 16
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
@z = dso_local global [257 x %1] zeroinitializer, align 16
@w = dso_local global [257 x %1] zeroinitializer, align 16
@e = dso_local global [130 x %1] zeroinitializer, align 16
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
  %7 = sext i32 %0 to i64
  br label %8

8:                                                ; preds = %33, %6
  %9 = phi i32 [ %.pre, %33 ], [ 0, %6 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %33 ], [ 0, %6 ]
  %.not = icmp eq i32 %9, 0
  %10 = icmp ne i64 %indvars.iv, 8
  %11 = select i1 %.not, i1 %10, i1 false
  br i1 %11, label %12, label %34

12:                                               ; preds = %8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  store i32 0, ptr %1, align 4
  %13 = getelementptr inbounds i32, ptr %3, i64 %indvars.iv.next
  %14 = load i32, ptr %13, align 4
  %.not1 = icmp eq i32 %14, 0
  br i1 %.not1, label %33, label %15

15:                                               ; preds = %12
  %16 = add nsw i64 %indvars.iv.next, %7
  %17 = getelementptr inbounds i32, ptr %2, i64 %16
  %18 = load i32, ptr %17, align 4
  %.not2 = icmp eq i32 %18, 0
  br i1 %.not2, label %33, label %19

19:                                               ; preds = %15
  %indvars.iv.next.neg = sub i64 0, %indvars.iv.next
  %20 = add i64 %7, 7
  %21 = add i64 %20, %indvars.iv.next.neg
  %22 = getelementptr inbounds i32, ptr %4, i64 %21
  %23 = load i32, ptr %22, align 4
  %.not3 = icmp eq i32 %23, 0
  br i1 %.not3, label %33, label %24

24:                                               ; preds = %19
  %25 = getelementptr inbounds i32, ptr %5, i64 %7
  %26 = trunc i64 %indvars.iv.next to i32
  store i32 %26, ptr %25, align 4
  store i32 0, ptr %13, align 4
  store i32 0, ptr %17, align 4
  store i32 0, ptr %22, align 4
  %27 = icmp slt i32 %0, 8
  br i1 %27, label %28, label %32

28:                                               ; preds = %24
  %29 = add nsw i32 %0, 1
  tail call void @Try(i32 noundef %29, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %30 = load i32, ptr %1, align 4
  %.not4 = icmp eq i32 %30, 0
  br i1 %.not4, label %31, label %33

31:                                               ; preds = %28
  store i32 1, ptr %13, align 4
  store i32 1, ptr %17, align 4
  store i32 1, ptr %22, align 4
  %.pre.pre = load i32, ptr %1, align 4
  br label %33

32:                                               ; preds = %24
  store i32 1, ptr %1, align 4
  br label %33

33:                                               ; preds = %32, %31, %28, %19, %15, %12
  %.pre = phi i32 [ 1, %32 ], [ %.pre.pre, %31 ], [ %30, %28 ], [ 0, %19 ], [ 0, %15 ], [ 0, %12 ]
  br label %8, !llvm.loop !6

34:                                               ; preds = %8
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

6:                                                ; preds = %21, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %21 ], [ -7, %0 ]
  %exitcond = icmp ne i64 %indvars.iv, 17
  br i1 %exitcond, label %7, label %22

7:                                                ; preds = %6
  %8 = icmp sgt i64 %indvars.iv, 0
  %9 = icmp slt i64 %indvars.iv, 9
  %or.cond = select i1 %8, i1 %9, i1 false
  br i1 %or.cond, label %10, label %12

10:                                               ; preds = %7
  %11 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %indvars.iv
  store i32 1, ptr %11, align 4
  br label %12

12:                                               ; preds = %10, %7
  %13 = icmp sgt i64 %indvars.iv, 1
  br i1 %13, label %14, label %16

14:                                               ; preds = %12
  %15 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %indvars.iv
  store i32 1, ptr %15, align 4
  br label %16

16:                                               ; preds = %14, %12
  %17 = icmp slt i64 %indvars.iv, 8
  br i1 %17, label %18, label %21

18:                                               ; preds = %16
  %19 = add nsw i64 %indvars.iv, 7
  %20 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %19
  store i32 1, ptr %20, align 4
  br label %21

21:                                               ; preds = %18, %16
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  br label %6, !llvm.loop !8

22:                                               ; preds = %6
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %23 = load i32, ptr %1, align 4
  %.not = icmp eq i32 %23, 0
  br i1 %.not, label %24, label %25

24:                                               ; preds = %22
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %25

25:                                               ; preds = %24, %22
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %3, %1
  %storemerge = phi i32 [ 1, %1 ], [ %4, %3 ]
  %exitcond = icmp ne i32 %storemerge, 51
  br i1 %exitcond, label %3, label %5

3:                                                ; preds = %2
  tail call void @Doit()
  %4 = add nuw nsw i32 %storemerge, 1
  br label %2, !llvm.loop !9

5:                                                ; preds = %2
  %6 = add nsw i32 %0, 1
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %6) #3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %2, %0
  %storemerge = phi i32 [ 0, %0 ], [ %3, %2 ]
  %exitcond = icmp ne i32 %storemerge, 100
  br i1 %exitcond, label %2, label %4

2:                                                ; preds = %1
  tail call void @Queens(i32 noundef %storemerge)
  %3 = add nuw nsw i32 %storemerge, 1
  br label %1, !llvm.loop !10

4:                                                ; preds = %1
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
