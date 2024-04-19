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
@1 = private unnamed_addr constant [18 x i8] c" Error in Queens.\00", align 1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @Initrand() #0 {
  store i64 74755, ptr @seed, align 8
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @Rand() #1 {
  %1 = load i64, ptr @seed, align 8
  %2 = mul nsw i64 %1, 1309
  %3 = add nsw i64 %2, 13849
  %4 = and i64 %3, 65535
  store i64 %4, ptr @seed, align 8
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: nofree noinline nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @Try(i32 noundef %0, ptr nocapture noundef %1, ptr nocapture noundef %2, ptr nocapture noundef %3, ptr nocapture noundef %4, ptr nocapture noundef writeonly %5) #2 {
  store i32 0, ptr %1, align 4
  %7 = sext i32 %0 to i64
  %8 = sext i32 %0 to i64
  br label %9

9:                                                ; preds = %43, %6
  %10 = phi i64 [ %16, %43 ], [ 0, %6 ]
  %11 = phi i32 [ 0, %6 ], [ %44, %43 ]
  %12 = icmp eq i32 %11, 0
  %13 = icmp ne i64 %10, 8
  %14 = select i1 %12, i1 %13, i1 false
  br i1 %14, label %15, label %45

15:                                               ; preds = %9
  %16 = add nuw nsw i64 %10, 1
  store i32 0, ptr %1, align 4
  %17 = getelementptr inbounds i32, ptr %3, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %43, label %20

20:                                               ; preds = %15
  %21 = add nsw i64 %7, %16
  %22 = getelementptr inbounds i32, ptr %2, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %43, label %25

25:                                               ; preds = %20
  %26 = sub nsw i64 %8, %16
  %27 = add nsw i64 %26, 7
  %28 = getelementptr inbounds i32, ptr %4, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %43, label %31

31:                                               ; preds = %25
  %32 = sext i32 %0 to i64
  %33 = getelementptr inbounds i32, ptr %5, i64 %32
  %34 = trunc i64 %16 to i32
  store i32 %34, ptr %33, align 4
  store i32 0, ptr %17, align 4
  store i32 0, ptr %22, align 4
  store i32 0, ptr %28, align 4
  %35 = icmp slt i32 %0, 8
  br i1 %35, label %36, label %42

36:                                               ; preds = %31
  %37 = add nsw i32 %0, 1
  tail call void @Try(i32 noundef %37, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %38 = load i32, ptr %1, align 4
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %43

40:                                               ; preds = %36
  store i32 1, ptr %17, align 4
  store i32 1, ptr %22, align 4
  store i32 1, ptr %28, align 4
  %41 = load i32, ptr %1, align 4
  br label %43

42:                                               ; preds = %31
  store i32 1, ptr %1, align 4
  br label %43

43:                                               ; preds = %42, %40, %36, %25, %20, %15
  %44 = phi i32 [ 1, %42 ], [ %41, %40 ], [ %38, %36 ], [ 0, %25 ], [ 0, %20 ], [ 0, %15 ]
  br label %9, !llvm.loop !6

45:                                               ; preds = %9
  ret void
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @Doit() #3 {
  %1 = alloca i32, align 4
  %2 = alloca [9 x i32], align 16
  %3 = alloca [17 x i32], align 16
  %4 = alloca [15 x i32], align 16
  %5 = alloca [9 x i32], align 16
  br label %6

6:                                                ; preds = %22, %0
  %7 = phi i64 [ %23, %22 ], [ -7, %0 ]
  %8 = icmp ne i64 %7, 17
  br i1 %8, label %9, label %24

9:                                                ; preds = %6
  %10 = icmp sgt i64 %7, 0
  %11 = icmp slt i64 %7, 9
  %12 = select i1 %10, i1 %11, i1 false
  br i1 %12, label %13, label %15

13:                                               ; preds = %9
  %14 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %7
  store i32 1, ptr %14, align 4
  br label %15

15:                                               ; preds = %13, %9
  %16 = icmp sgt i64 %7, 1
  br i1 %16, label %17, label %.thread

17:                                               ; preds = %15
  %18 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %7
  store i32 1, ptr %18, align 4
  %19 = icmp slt i64 %7, 8
  br i1 %19, label %.thread, label %22

.thread:                                          ; preds = %15, %17
  %20 = add nsw i64 %7, 7
  %21 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %20
  store i32 1, ptr %21, align 4
  br label %22

22:                                               ; preds = %.thread, %17
  %23 = add nsw i64 %7, 1
  br label %6, !llvm.loop !8

24:                                               ; preds = %6
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %25 = load i32, ptr %1, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

27:                                               ; preds = %24
  %28 = tail call i32 @puts(ptr nonnull dereferenceable(1) @1)
  br label %29

29:                                               ; preds = %27, %24
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #5 {
  br label %2

2:                                                ; preds = %5, %1
  %3 = phi i32 [ 1, %1 ], [ %6, %5 ]
  %4 = icmp ne i32 %3, 51
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  tail call void @Doit()
  %6 = add nuw nsw i32 %3, 1
  br label %2, !llvm.loop !9

7:                                                ; preds = %2
  %8 = add nsw i32 %0, 1
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %8) #7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #5 {
  br label %1

1:                                                ; preds = %4, %0
  %2 = phi i32 [ 0, %0 ], [ %5, %4 ]
  %3 = icmp ne i32 %2, 100
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  tail call void @Queens(i32 noundef %2)
  %5 = add nuw nsw i32 %2, 1
  br label %1, !llvm.loop !10

6:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #6

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind }
attributes #7 = { nounwind }

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
