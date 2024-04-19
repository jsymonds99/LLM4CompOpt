; ModuleID = 'custom3_unoptimized.ll'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Original Matrix:\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Manipulated Matrix:\0A\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Original Matrix:\00", align 1
@str.1 = private unnamed_addr constant [20 x i8] c"Manipulated Matrix:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMatrix(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  br label %5

5:                                                ; preds = %23, %1
  %storemerge = phi i32 [ 0, %1 ], [ %25, %23 ]
  store i32 %storemerge, ptr %3, align 4
  %6 = icmp slt i32 %storemerge, 5
  br i1 %6, label %7, label %26

7:                                                ; preds = %5
  br label %8

8:                                                ; preds = %19, %7
  %storemerge1 = phi i32 [ 0, %7 ], [ %21, %19 ]
  store i32 %storemerge1, ptr %4, align 4
  %9 = icmp slt i32 %storemerge1, 5
  br i1 %9, label %10, label %22

10:                                               ; preds = %8
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %3, align 4
  %13 = sext i32 %12 to i64
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5 x i32], ptr %11, i64 %13, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %17) #4
  br label %19

19:                                               ; preds = %10
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 1
  br label %8, !llvm.loop !6

22:                                               ; preds = %8
  %putchar2 = call i32 @putchar(i32 10)
  br label %23

23:                                               ; preds = %22
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 1
  br label %5, !llvm.loop !8

26:                                               ; preds = %5
  %putchar = call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  br label %9

9:                                                ; preds = %101, %1
  %storemerge = phi i32 [ 0, %1 ], [ %103, %101 ]
  store i32 %storemerge, ptr %3, align 4
  %10 = icmp slt i32 %storemerge, 5
  br i1 %10, label %11, label %104

11:                                               ; preds = %9
  br label %12

12:                                               ; preds = %97, %11
  %storemerge1 = phi i32 [ 0, %11 ], [ %99, %97 ]
  store i32 %storemerge1, ptr %4, align 4
  %13 = icmp slt i32 %storemerge1, 5
  br i1 %13, label %14, label %100

14:                                               ; preds = %12
  br label %15

15:                                               ; preds = %93, %14
  %storemerge2 = phi i32 [ 0, %14 ], [ %95, %93 ]
  store i32 %storemerge2, ptr %5, align 4
  %16 = icmp slt i32 %storemerge2, 5
  br i1 %16, label %17, label %96

17:                                               ; preds = %15
  %18 = load i32, ptr %5, align 4
  %19 = load ptr, ptr %2, align 8
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32, ptr %4, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [5 x i32], ptr %19, i64 %21, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = add nsw i32 %25, %18
  store i32 %26, ptr %24, align 4
  br label %27

27:                                               ; preds = %89, %17
  %storemerge3 = phi i32 [ 0, %17 ], [ %91, %89 ]
  store i32 %storemerge3, ptr %6, align 4
  %28 = icmp slt i32 %storemerge3, 5
  br i1 %28, label %29, label %92

29:                                               ; preds = %27
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, 1
  %32 = load ptr, ptr %2, align 8
  %33 = load i32, ptr %3, align 4
  %34 = sext i32 %33 to i64
  %35 = load i32, ptr %4, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [5 x i32], ptr %32, i64 %34, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = mul nsw i32 %38, %31
  store i32 %39, ptr %37, align 4
  br label %40

40:                                               ; preds = %85, %29
  %storemerge4 = phi i32 [ 0, %29 ], [ %87, %85 ]
  store i32 %storemerge4, ptr %7, align 4
  %41 = icmp slt i32 %storemerge4, 5
  br i1 %41, label %42, label %88

42:                                               ; preds = %40
  %43 = load i32, ptr %7, align 4
  %44 = load i32, ptr %3, align 4
  %45 = load i32, ptr %4, align 4
  %46 = add nsw i32 %44, %45
  %47 = mul nsw i32 %43, %46
  %48 = load ptr, ptr %2, align 8
  %49 = sext i32 %44 to i64
  %50 = sext i32 %45 to i64
  %51 = getelementptr inbounds [5 x i32], ptr %48, i64 %49, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = sub nsw i32 %52, %47
  store i32 %53, ptr %51, align 4
  br label %54

54:                                               ; preds = %81, %42
  %storemerge5 = phi i32 [ 0, %42 ], [ %83, %81 ]
  store i32 %storemerge5, ptr %8, align 4
  %55 = icmp slt i32 %storemerge5, 5
  br i1 %55, label %56, label %84

56:                                               ; preds = %54
  %57 = load i32, ptr %8, align 4
  %58 = and i32 %57, 1
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %70

60:                                               ; preds = %56
  %61 = load i32, ptr %8, align 4
  %62 = load ptr, ptr %2, align 8
  %63 = load i32, ptr %3, align 4
  %64 = sext i32 %63 to i64
  %65 = load i32, ptr %4, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [5 x i32], ptr %62, i64 %64, i64 %66
  %68 = load i32, ptr %67, align 4
  %69 = add nsw i32 %68, %61
  store i32 %69, ptr %67, align 4
  br label %80

70:                                               ; preds = %56
  %71 = load i32, ptr %8, align 4
  %72 = load ptr, ptr %2, align 8
  %73 = load i32, ptr %3, align 4
  %74 = sext i32 %73 to i64
  %75 = load i32, ptr %4, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [5 x i32], ptr %72, i64 %74, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = sub nsw i32 %78, %71
  store i32 %79, ptr %77, align 4
  br label %80

80:                                               ; preds = %70, %60
  br label %81

81:                                               ; preds = %80
  %82 = load i32, ptr %8, align 4
  %83 = add nsw i32 %82, 1
  br label %54, !llvm.loop !9

84:                                               ; preds = %54
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %7, align 4
  %87 = add nsw i32 %86, 1
  br label %40, !llvm.loop !10

88:                                               ; preds = %40
  br label %89

89:                                               ; preds = %88
  %90 = load i32, ptr %6, align 4
  %91 = add nsw i32 %90, 1
  br label %27, !llvm.loop !11

92:                                               ; preds = %27
  br label %93

93:                                               ; preds = %92
  %94 = load i32, ptr %5, align 4
  %95 = add nsw i32 %94, 1
  br label %15, !llvm.loop !12

96:                                               ; preds = %15
  br label %97

97:                                               ; preds = %96
  %98 = load i32, ptr %4, align 4
  %99 = add nsw i32 %98, 1
  br label %12, !llvm.loop !13

100:                                              ; preds = %12
  br label %101

101:                                              ; preds = %100
  %102 = load i32, ptr %3, align 4
  %103 = add nsw i32 %102, 1
  br label %9, !llvm.loop !14

104:                                              ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %21, %0
  %storemerge = phi i32 [ 0, %0 ], [ %23, %21 ]
  store i32 %storemerge, ptr %2, align 4
  %5 = icmp slt i32 %storemerge, 5
  br i1 %5, label %6, label %24

6:                                                ; preds = %4
  br label %7

7:                                                ; preds = %17, %6
  %storemerge2 = phi i32 [ 0, %6 ], [ %19, %17 ]
  store i32 %storemerge2, ptr %3, align 4
  %8 = icmp slt i32 %storemerge2, 5
  br i1 %8, label %9, label %20

9:                                                ; preds = %7
  %10 = call i32 @rand() #4
  %11 = srem i32 %10, 10
  %12 = load i32, ptr %2, align 4
  %13 = sext i32 %12 to i64
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %13, i64 %15
  store i32 %11, ptr %16, align 4
  br label %17

17:                                               ; preds = %9
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, 1
  br label %7, !llvm.loop !15

20:                                               ; preds = %7
  br label %21

21:                                               ; preds = %20
  %22 = load i32, ptr %2, align 4
  %23 = add nsw i32 %22, 1
  br label %4, !llvm.loop !16

24:                                               ; preds = %4
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1)
  call void @manipulateMatrix(ptr noundef nonnull %1)
  %puts1 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @printMatrix(ptr noundef nonnull %1)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

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
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
