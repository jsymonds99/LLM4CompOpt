; ModuleID = 'towers_unoptimized.ll'
source_filename = "towers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i32 }
%1 = type { float, float }

@0 = internal local_unnamed_addr global i64 0, align 8
@1 = private unnamed_addr constant [22 x i8] c" Error in Towers: %s\0A\00", align 1
@2 = internal local_unnamed_addr global [4 x i32] zeroinitializer, align 16
@3 = internal local_unnamed_addr global i32 0, align 4
@4 = internal local_unnamed_addr global [19 x %0] zeroinitializer, align 16
@5 = private unnamed_addr constant [16 x i8] c"out of space   \00", align 1
@6 = private unnamed_addr constant [16 x i8] c"disc size error\00", align 1
@7 = private unnamed_addr constant [16 x i8] c"nothing to pop \00", align 1
@8 = internal local_unnamed_addr global i32 0, align 4
@9 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@10 = internal local_unnamed_addr global float 0.000000e+00, align 4
@11 = internal local_unnamed_addr global float 0.000000e+00, align 4
@12 = internal local_unnamed_addr global float 0.000000e+00, align 4
@13 = internal local_unnamed_addr global [11 x i32] zeroinitializer, align 16
@14 = internal local_unnamed_addr global i32 0, align 4
@15 = internal local_unnamed_addr global ptr null, align 8
@16 = internal local_unnamed_addr global [41 x [41 x i32]] zeroinitializer, align 16
@17 = internal local_unnamed_addr global [41 x [41 x i32]] zeroinitializer, align 16
@18 = internal local_unnamed_addr global [41 x [41 x i32]] zeroinitializer, align 16
@19 = internal local_unnamed_addr global [41 x [41 x float]] zeroinitializer, align 16
@20 = internal local_unnamed_addr global [41 x [41 x float]] zeroinitializer, align 16
@21 = internal local_unnamed_addr global [41 x [41 x float]] zeroinitializer, align 16
@22 = internal local_unnamed_addr global [4 x i32] zeroinitializer, align 16
@23 = internal local_unnamed_addr global [13 x i32] zeroinitializer, align 16
@24 = internal local_unnamed_addr global [13 x i32] zeroinitializer, align 16
@25 = internal local_unnamed_addr global [512 x i32] zeroinitializer, align 16
@26 = internal local_unnamed_addr global [13 x [512 x i32]] zeroinitializer, align 16
@27 = internal local_unnamed_addr global i32 0, align 4
@28 = internal local_unnamed_addr global i32 0, align 4
@29 = internal local_unnamed_addr global [5001 x i32] zeroinitializer, align 16
@30 = internal local_unnamed_addr global i32 0, align 4
@31 = internal local_unnamed_addr global i32 0, align 4
@32 = internal local_unnamed_addr global i32 0, align 4
@33 = internal local_unnamed_addr global [257 x %1] zeroinitializer, align 16
@34 = internal local_unnamed_addr global [257 x %1] zeroinitializer, align 16
@35 = internal local_unnamed_addr global [130 x %1] zeroinitializer, align 16
@36 = internal local_unnamed_addr global float 0.000000e+00, align 4
@37 = internal local_unnamed_addr global float 0.000000e+00, align 4
@38 = private unnamed_addr constant [18 x i8] c" Error in Towers.\00", align 1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define internal void @39() local_unnamed_addr #0 {
  %1 = bitcast i32 0 to i32
  store i64 74755, ptr @0, align 8
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable
define internal i32 @40() local_unnamed_addr #1 {
  %1 = bitcast i32 0 to i32
  %2 = load i64, ptr @0, align 8
  %3 = mul nsw i64 %2, 1309
  %4 = add nsw i64 %3, 13849
  %5 = and i64 %4, 65535
  store i64 %5, ptr @0, align 8
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define internal void @41(ptr noundef %0) local_unnamed_addr #2 {
  %2 = bitcast i32 0 to i32
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @1, ptr noundef %0) #6
  ret void
}

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #3

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define internal void @42(i32 noundef %0) local_unnamed_addr #0 {
  %2 = bitcast i32 0 to i32
  %3 = sext i32 %0 to i64
  %4 = getelementptr inbounds [4 x i32], ptr @2, i64 0, i64 %3
  store i32 0, ptr %4, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @43() local_unnamed_addr #2 {
  %1 = bitcast i32 0 to i32
  %2 = load i32, ptr @3, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %0
  %5 = sext i32 %2 to i64
  %6 = getelementptr inbounds [19 x %0], ptr @4, i64 0, i64 %5, i32 1
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr @3, align 4
  br label %9

8:                                                ; preds = %0
  tail call void @41(ptr noundef nonnull @5)
  br label %9

9:                                                ; preds = %8, %4
  %10 = phi i32 [ %2, %4 ], [ 0, %8 ]
  ret i32 %10
}

; Function Attrs: noinline nounwind uwtable
define internal void @44(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = bitcast i32 0 to i32
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds [4 x i32], ptr @2, i64 0, i64 %4
  %6 = load i32, ptr %5, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %9, label %8

8:                                                ; preds = %2
  br label %16

9:                                                ; preds = %2
  %10 = sext i32 %6 to i64
  %11 = getelementptr inbounds [19 x %0], ptr @4, i64 0, i64 %10
  %12 = load i32, ptr %11, align 8
  %13 = icmp sgt i32 %12, %0
  br i1 %13, label %14, label %15

14:                                               ; preds = %9
  br label %16

15:                                               ; preds = %9
  tail call void @41(ptr noundef nonnull @6)
  br label %22

16:                                               ; preds = %14, %8
  %17 = tail call i32 @43()
  %18 = load i32, ptr %5, align 4
  %19 = sext i32 %17 to i64
  %20 = getelementptr inbounds [19 x %0], ptr @4, i64 0, i64 %19
  %21 = getelementptr inbounds [19 x %0], ptr @4, i64 0, i64 %19, i32 1
  store i32 %18, ptr %21, align 4
  store i32 %17, ptr %5, align 4
  store i32 %0, ptr %20, align 8
  br label %22

22:                                               ; preds = %15, %16
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @45(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = bitcast i32 0 to i32
  tail call void @42(i32 noundef %0)
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %2
  br label %13

6:                                                ; preds = %2
  br label %7

7:                                                ; preds = %11, %6
  %8 = phi i32 [ %1, %6 ], [ %9, %11 ]
  tail call void @44(i32 noundef %8, i32 noundef %0)
  %9 = add nsw i32 %8, -1
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %12, !llvm.loop !6

11:                                               ; preds = %7
  br label %7

12:                                               ; preds = %7
  br label %13

13:                                               ; preds = %5, %12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @46(i32 noundef %0) local_unnamed_addr #2 {
  %2 = bitcast i32 0 to i32
  %3 = sext i32 %0 to i64
  %4 = getelementptr inbounds [4 x i32], ptr @2, i64 0, i64 %3
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %14

7:                                                ; preds = %1
  %8 = sext i32 %5 to i64
  %9 = getelementptr inbounds [19 x %0], ptr @4, i64 0, i64 %8
  %10 = load i32, ptr %9, align 8
  %11 = getelementptr inbounds [19 x %0], ptr @4, i64 0, i64 %8, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = load i32, ptr @3, align 4
  store i32 %13, ptr %11, align 4
  store i32 %5, ptr @3, align 4
  store i32 %12, ptr %4, align 4
  br label %15

14:                                               ; preds = %1
  tail call void @41(ptr noundef nonnull @7)
  br label %15

15:                                               ; preds = %14, %7
  %16 = phi i32 [ %10, %7 ], [ 0, %14 ]
  ret i32 %16
}

; Function Attrs: noinline nounwind uwtable
define internal void @47(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = bitcast i32 0 to i32
  %4 = tail call i32 @46(i32 noundef %0)
  tail call void @44(i32 noundef %4, i32 noundef %1)
  %5 = load i32, ptr @8, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, ptr @8, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @48(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = alloca i32, align 4
  %5 = bitcast i32 0 to i32
  br label %6

6:                                                ; preds = %3
  call void @llvm.lifetime.start.p0(i64 -1, ptr %4)
  call void @51(i32 %0, i32 %2, i32 %1, ptr %4)
  %7 = load i32, ptr %4, align 4
  call void @llvm.lifetime.end.p0(i64 -1, ptr %4)
  br label %8

8:                                                ; preds = %6
  tail call void @47(i32 noundef %7, i32 noundef %1)
  br label %9

9:                                                ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @49() local_unnamed_addr #2 {
  %1 = bitcast i32 0 to i32
  br label %2

2:                                                ; preds = %0
  call void @52()
  br label %3

3:                                                ; preds = %2
  store i32 18, ptr @3, align 4
  tail call void @45(i32 noundef 1, i32 noundef 14)
  tail call void @42(i32 noundef 2)
  tail call void @42(i32 noundef 3)
  store i32 0, ptr @8, align 4
  tail call void @48(i32 noundef 1, i32 noundef 2, i32 noundef 14)
  %4 = load i32, ptr @8, align 4
  %5 = icmp eq i32 %4, 16383
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  br label %10

7:                                                ; preds = %3
  %8 = tail call i32 @puts(ptr nonnull dereferenceable(1) @38)
  %9 = load i32, ptr @8, align 4
  br label %10

10:                                               ; preds = %6, %7
  %11 = phi i32 [ 16383, %6 ], [ %9, %7 ]
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @9, i32 noundef %11) #6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @50() local_unnamed_addr #2 {
  %1 = bitcast i32 0 to i32
  br label %2

2:                                                ; preds = %6, %0
  %3 = phi i32 [ 100, %0 ], [ %4, %6 ]
  tail call void @49()
  %4 = add nsw i32 %3, -1
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7, !llvm.loop !8

6:                                                ; preds = %2
  br label %2

7:                                                ; preds = %2
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #4

; Function Attrs: noinline nounwind uwtable
define internal void @51(i32 %0, i32 %1, i32 %2, ptr %3) #2 {
  %5 = bitcast i32 0 to i32
  %6 = add i32 %1, -1
  store i32 %0, ptr %3, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  br label %21

9:                                                ; preds = %4
  br label %10

10:                                               ; preds = %19, %9
  %11 = phi i32 [ %6, %9 ], [ %17, %19 ]
  %12 = phi i32 [ %0, %9 ], [ %16, %19 ]
  %13 = sub i32 0, %12
  %14 = sub i32 0, %2
  %15 = add i32 %13, 6
  %16 = add i32 %15, %14
  tail call void @48(i32 noundef %12, i32 noundef %16, i32 noundef %11)
  tail call void @47(i32 noundef %12, i32 noundef %2)
  %17 = add i32 %11, -1
  store i32 %16, ptr %3, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %20, label %19

19:                                               ; preds = %10
  br label %10

20:                                               ; preds = %10
  br label %21

21:                                               ; preds = %8, %20
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: noinline nounwind uwtable
define internal void @52() #2 {
  %1 = bitcast i32 0 to i32
  br label %2

2:                                                ; preds = %0
  store i32 0, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 1, i32 1), align 4
  store i32 1, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 2, i32 1), align 4
  store i32 2, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 3, i32 1), align 4
  store i32 3, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 4, i32 1), align 4
  store i32 4, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 5, i32 1), align 4
  store i32 5, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 6, i32 1), align 4
  store i32 6, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 7, i32 1), align 4
  store i32 7, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 8, i32 1), align 4
  store i32 8, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 9, i32 1), align 4
  store i32 9, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 10, i32 1), align 4
  store i32 10, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 11, i32 1), align 4
  store i32 11, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 12, i32 1), align 4
  store i32 12, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 13, i32 1), align 4
  store i32 13, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 14, i32 1), align 4
  store i32 14, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 15, i32 1), align 4
  store i32 15, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 16, i32 1), align 4
  store i32 16, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 17, i32 1), align 4
  store i32 17, ptr getelementptr inbounds ([19 x %0], ptr @4, i64 0, i64 18, i32 1), align 4
  ret void
}

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind }

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
