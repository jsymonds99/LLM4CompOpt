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

; Function Attrs: nofree noinline nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @Try(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #2 {
  store i32 0, ptr %1, align 4
  br label %7

7:                                                ; preds = %63, %6
  %8 = phi i32 [ 0, %6 ], [ %14, %63 ]
  %9 = load i32, ptr %1, align 4
  %10 = icmp eq i32 %9, 0
  %11 = icmp ne i32 %8, 8
  %12 = select i1 %10, i1 %11, i1 false
  br i1 %12, label %13, label %64

13:                                               ; preds = %7
  %14 = add nsw i32 %8, 1
  store i32 0, ptr %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %3, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %63, label %19

19:                                               ; preds = %13
  %20 = add nsw i32 %14, %0
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, ptr %2, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %63, label %25

25:                                               ; preds = %19
  %26 = sub i32 0, %14
  %27 = add i32 %0, 7
  %28 = add i32 %27, %26
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %4, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %63, label %33

33:                                               ; preds = %25
  %34 = sext i32 %0 to i64
  %35 = getelementptr inbounds i32, ptr %5, i64 %34
  store i32 %14, ptr %35, align 4
  %36 = sext i32 %14 to i64
  %37 = getelementptr inbounds i32, ptr %3, i64 %36
  store i32 0, ptr %37, align 4
  %38 = add nsw i32 %0, %14
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %2, i64 %39
  store i32 0, ptr %40, align 4
  %41 = sub i32 0, %14
  %42 = add i32 %0, 7
  %43 = add i32 %42, %41
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %4, i64 %44
  store i32 0, ptr %45, align 4
  %46 = icmp slt i32 %0, 8
  br i1 %46, label %47, label %62

47:                                               ; preds = %33
  %48 = add nsw i32 %0, 1
  tail call void @Try(i32 noundef %48, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %49 = load i32, ptr %1, align 4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %63

51:                                               ; preds = %47
  %52 = sext i32 %14 to i64
  %53 = getelementptr inbounds i32, ptr %3, i64 %52
  store i32 1, ptr %53, align 4
  %54 = add nsw i32 %0, %14
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, ptr %2, i64 %55
  store i32 1, ptr %56, align 4
  %57 = sub i32 0, %14
  %58 = add i32 %0, 7
  %59 = add i32 %58, %57
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, ptr %4, i64 %60
  store i32 1, ptr %61, align 4
  br label %63

62:                                               ; preds = %33
  store i32 1, ptr %1, align 4
  br label %63

63:                                               ; preds = %62, %51, %47, %25, %19, %13
  br label %7, !llvm.loop !6

64:                                               ; preds = %7
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

6:                                                ; preds = %27, %0
  %7 = phi i32 [ -7, %0 ], [ %28, %27 ]
  %8 = icmp slt i32 %7, 17
  br i1 %8, label %9, label %29

9:                                                ; preds = %6
  %10 = icmp sgt i32 %7, 0
  %11 = icmp slt i32 %7, 9
  %12 = select i1 %10, i1 %11, i1 false
  br i1 %12, label %13, label %16

13:                                               ; preds = %9
  %14 = sext i32 %7 to i64
  %15 = getelementptr inbounds [9 x i32], ptr %2, i64 0, i64 %14
  store i32 1, ptr %15, align 4
  br label %16

16:                                               ; preds = %13, %9
  %17 = icmp sgt i32 %7, 1
  br i1 %17, label %18, label %21

18:                                               ; preds = %16
  %19 = sext i32 %7 to i64
  %20 = getelementptr inbounds [17 x i32], ptr %3, i64 0, i64 %19
  store i32 1, ptr %20, align 4
  br label %21

21:                                               ; preds = %18, %16
  %22 = icmp slt i32 %7, 8
  br i1 %22, label %23, label %27

23:                                               ; preds = %21
  %24 = add nsw i32 %7, 7
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [15 x i32], ptr %4, i64 0, i64 %25
  store i32 1, ptr %26, align 4
  br label %27

27:                                               ; preds = %23, %21
  %28 = add nsw i32 %7, 1
  br label %6, !llvm.loop !8

29:                                               ; preds = %6
  call void @Try(i32 noundef 1, ptr noundef nonnull %1, ptr noundef nonnull %3, ptr noundef nonnull %2, ptr noundef nonnull %4, ptr noundef nonnull %5)
  %30 = load i32, ptr %1, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %29
  %33 = call i32 @puts(ptr nonnull dereferenceable(1) @1)
  br label %34

34:                                               ; preds = %32, %29
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @Queens(i32 noundef %0) #5 {
  br label %2

2:                                                ; preds = %5, %1
  %3 = phi i32 [ 1, %1 ], [ %6, %5 ]
  %4 = icmp slt i32 %3, 51
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  tail call void @Doit()
  %6 = add nsw i32 %3, 1
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
  %3 = icmp slt i32 %2, 100
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  tail call void @Queens(i32 noundef %2)
  %5 = add nsw i32 %2, 1
  br label %1, !llvm.loop !10

6:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #6

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
