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
  br label %2

2:                                                ; preds = %16, %1
  %3 = phi i32 [ %17, %16 ], [ 0, %1 ]
  %4 = icmp ult i32 %3, 5
  br i1 %4, label %5, label %18

5:                                                ; preds = %2
  br label %6

6:                                                ; preds = %9, %5
  %7 = phi i32 [ %15, %9 ], [ 0, %5 ]
  %8 = icmp ult i32 %7, 5
  br i1 %8, label %9, label %16

9:                                                ; preds = %6
  %10 = zext i32 %3 to i64
  %11 = zext i32 %7 to i64
  %12 = getelementptr inbounds [5 x i32], ptr %0, i64 %10, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %13) #4
  %15 = add nuw nsw i32 %7, 1
  br label %6, !llvm.loop !6

16:                                               ; preds = %6
  %putchar1 = call i32 @putchar(i32 10)
  %17 = add nuw nsw i32 %3, 1
  br label %2, !llvm.loop !8

18:                                               ; preds = %2
  %putchar = call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  br label %6

6:                                                ; preds = %106, %1
  %7 = phi i32 [ %107, %106 ], [ 0, %1 ]
  %8 = icmp slt i32 %7, 5
  br i1 %8, label %9, label %108

9:                                                ; preds = %6
  br label %10

10:                                               ; preds = %104, %9
  %11 = phi i32 [ %21, %104 ], [ %7, %9 ]
  %12 = phi i32 [ %23, %104 ], [ %7, %9 ]
  %13 = phi i32 [ %25, %104 ], [ %7, %9 ]
  %14 = phi i32 [ %27, %104 ], [ %7, %9 ]
  %15 = phi i32 [ %28, %104 ], [ %7, %9 ]
  %16 = phi i32 [ %105, %104 ], [ 0, %9 ]
  %17 = icmp slt i32 %16, 5
  br i1 %17, label %18, label %106

18:                                               ; preds = %10
  br label %19

19:                                               ; preds = %101, %18
  %storemerge = phi i32 [ 0, %18 ], [ %103, %101 ]
  %20 = phi i32 [ %16, %18 ], [ %37, %101 ]
  %21 = phi i32 [ %11, %18 ], [ %38, %101 ]
  %22 = phi i32 [ %16, %18 ], [ %39, %101 ]
  %23 = phi i32 [ %12, %18 ], [ %40, %101 ]
  %24 = phi i32 [ %16, %18 ], [ %41, %101 ]
  %25 = phi i32 [ %13, %18 ], [ %42, %101 ]
  %26 = phi i32 [ %16, %18 ], [ %43, %101 ]
  %27 = phi i32 [ %14, %18 ], [ %44, %101 ]
  %28 = phi i32 [ %15, %18 ], [ %44, %101 ]
  store i32 %storemerge, ptr %2, align 4
  %29 = icmp slt i32 %storemerge, 5
  br i1 %29, label %30, label %104

30:                                               ; preds = %19
  %31 = sext i32 %27 to i64
  %32 = sext i32 %26 to i64
  %33 = getelementptr inbounds [5 x i32], ptr %0, i64 %31, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = add nsw i32 %34, %storemerge
  store i32 %35, ptr %33, align 4
  br label %36

36:                                               ; preds = %98, %30
  %storemerge1 = phi i32 [ 0, %30 ], [ %100, %98 ]
  %37 = phi i32 [ %20, %30 ], [ %54, %98 ]
  %38 = phi i32 [ %21, %30 ], [ %55, %98 ]
  %39 = phi i32 [ %22, %30 ], [ %56, %98 ]
  %40 = phi i32 [ %23, %30 ], [ %57, %98 ]
  %41 = phi i32 [ %24, %30 ], [ %58, %98 ]
  %42 = phi i32 [ %25, %30 ], [ %59, %98 ]
  %43 = phi i32 [ %26, %30 ], [ %58, %98 ]
  %44 = phi i32 [ %27, %30 ], [ %59, %98 ]
  store i32 %storemerge1, ptr %3, align 4
  %45 = icmp slt i32 %storemerge1, 5
  br i1 %45, label %46, label %101

46:                                               ; preds = %36
  %47 = add nsw i32 %storemerge1, 1
  %48 = sext i32 %42 to i64
  %49 = sext i32 %41 to i64
  %50 = getelementptr inbounds [5 x i32], ptr %0, i64 %48, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = mul nsw i32 %51, %47
  store i32 %52, ptr %50, align 4
  br label %53

53:                                               ; preds = %95, %46
  %storemerge2 = phi i32 [ 0, %46 ], [ %97, %95 ]
  %54 = phi i32 [ %37, %46 ], [ %70, %95 ]
  %55 = phi i32 [ %38, %46 ], [ %71, %95 ]
  %56 = phi i32 [ %39, %46 ], [ %72, %95 ]
  %57 = phi i32 [ %40, %46 ], [ %73, %95 ]
  %58 = phi i32 [ %41, %46 ], [ %72, %95 ]
  %59 = phi i32 [ %42, %46 ], [ %73, %95 ]
  store i32 %storemerge2, ptr %4, align 4
  %60 = icmp slt i32 %storemerge2, 5
  br i1 %60, label %61, label %98

61:                                               ; preds = %53
  %62 = add nsw i32 %59, %58
  %63 = mul nsw i32 %storemerge2, %62
  %64 = sext i32 %57 to i64
  %65 = sext i32 %56 to i64
  %66 = getelementptr inbounds [5 x i32], ptr %0, i64 %64, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = sub nsw i32 %67, %63
  store i32 %68, ptr %66, align 4
  br label %69

69:                                               ; preds = %90, %61
  %storemerge3 = phi i32 [ 0, %61 ], [ %94, %90 ]
  %70 = phi i32 [ %54, %61 ], [ %92, %90 ]
  %71 = phi i32 [ %55, %61 ], [ %93, %90 ]
  %72 = phi i32 [ %56, %61 ], [ %92, %90 ]
  %73 = phi i32 [ %57, %61 ], [ %93, %90 ]
  store i32 %storemerge3, ptr %5, align 4
  %74 = icmp slt i32 %storemerge3, 5
  br i1 %74, label %75, label %95

75:                                               ; preds = %69
  %76 = and i32 %storemerge3, 1
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %84

78:                                               ; preds = %75
  %79 = sext i32 %7 to i64
  %80 = sext i32 %16 to i64
  %81 = getelementptr inbounds [5 x i32], ptr %0, i64 %79, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = add nsw i32 %82, %storemerge3
  store i32 %83, ptr %81, align 4
  br label %90

84:                                               ; preds = %75
  %85 = sext i32 %71 to i64
  %86 = sext i32 %70 to i64
  %87 = getelementptr inbounds [5 x i32], ptr %0, i64 %85, i64 %86
  %88 = load i32, ptr %87, align 4
  %89 = sub nsw i32 %88, %storemerge3
  store i32 %89, ptr %87, align 4
  %.pre = load i32, ptr %5, align 4
  br label %90

90:                                               ; preds = %84, %78
  %91 = phi i32 [ %.pre, %84 ], [ %storemerge3, %78 ]
  %92 = phi i32 [ %70, %84 ], [ %16, %78 ]
  %93 = phi i32 [ %71, %84 ], [ %7, %78 ]
  %94 = add nsw i32 %91, 1
  br label %69, !llvm.loop !9

95:                                               ; preds = %69
  %96 = load i32, ptr %4, align 4
  %97 = add nsw i32 %96, 1
  br label %53, !llvm.loop !10

98:                                               ; preds = %53
  %99 = load i32, ptr %3, align 4
  %100 = add nsw i32 %99, 1
  br label %36, !llvm.loop !11

101:                                              ; preds = %36
  %102 = load i32, ptr %2, align 4
  %103 = add nsw i32 %102, 1
  br label %19, !llvm.loop !12

104:                                              ; preds = %19
  %105 = add nsw i32 %26, 1
  br label %10, !llvm.loop !13

106:                                              ; preds = %10
  %107 = add nsw i32 %15, 1
  br label %6, !llvm.loop !14

108:                                              ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %16, %0
  %3 = phi i32 [ %17, %16 ], [ 0, %0 ]
  %4 = icmp ult i32 %3, 5
  br i1 %4, label %5, label %18

5:                                                ; preds = %2
  br label %6

6:                                                ; preds = %9, %5
  %7 = phi i32 [ %15, %9 ], [ 0, %5 ]
  %8 = icmp ult i32 %7, 5
  br i1 %8, label %9, label %16

9:                                                ; preds = %6
  %10 = call i32 @rand() #4
  %11 = srem i32 %10, 10
  %12 = zext i32 %3 to i64
  %13 = zext i32 %7 to i64
  %14 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %12, i64 %13
  store i32 %11, ptr %14, align 4
  %15 = add nuw nsw i32 %7, 1
  br label %6, !llvm.loop !15

16:                                               ; preds = %6
  %17 = add nuw nsw i32 %3, 1
  br label %2, !llvm.loop !16

18:                                               ; preds = %2
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
