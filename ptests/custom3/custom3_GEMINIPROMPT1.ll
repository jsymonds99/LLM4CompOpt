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
  br label %2

2:                                                ; preds = %99, %1
  %3 = phi i32 [ %100, %99 ], [ 0, %1 ]
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %101

5:                                                ; preds = %2
  br label %6

6:                                                ; preds = %97, %5
  %7 = phi i32 [ %17, %97 ], [ %3, %5 ]
  %8 = phi i32 [ %19, %97 ], [ %3, %5 ]
  %9 = phi i32 [ %21, %97 ], [ %3, %5 ]
  %10 = phi i32 [ %23, %97 ], [ %3, %5 ]
  %11 = phi i32 [ %24, %97 ], [ %3, %5 ]
  %12 = phi i32 [ %98, %97 ], [ 0, %5 ]
  %13 = icmp slt i32 %12, 5
  br i1 %13, label %14, label %99

14:                                               ; preds = %6
  br label %15

15:                                               ; preds = %95, %14
  %storemerge = phi i32 [ 0, %14 ], [ %96, %95 ]
  %16 = phi i32 [ %12, %14 ], [ %33, %95 ]
  %17 = phi i32 [ %7, %14 ], [ %34, %95 ]
  %18 = phi i32 [ %12, %14 ], [ %35, %95 ]
  %19 = phi i32 [ %8, %14 ], [ %36, %95 ]
  %20 = phi i32 [ %12, %14 ], [ %37, %95 ]
  %21 = phi i32 [ %9, %14 ], [ %38, %95 ]
  %22 = phi i32 [ %12, %14 ], [ %39, %95 ]
  %23 = phi i32 [ %10, %14 ], [ %40, %95 ]
  %24 = phi i32 [ %11, %14 ], [ %40, %95 ]
  %25 = icmp slt i32 %storemerge, 5
  br i1 %25, label %26, label %97

26:                                               ; preds = %15
  %27 = sext i32 %23 to i64
  %28 = sext i32 %22 to i64
  %29 = getelementptr inbounds [5 x i32], ptr %0, i64 %27, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = add nsw i32 %30, %storemerge
  store i32 %31, ptr %29, align 4
  br label %32

32:                                               ; preds = %93, %26
  %storemerge1 = phi i32 [ 0, %26 ], [ %94, %93 ]
  %33 = phi i32 [ %16, %26 ], [ %50, %93 ]
  %34 = phi i32 [ %17, %26 ], [ %51, %93 ]
  %35 = phi i32 [ %18, %26 ], [ %52, %93 ]
  %36 = phi i32 [ %19, %26 ], [ %53, %93 ]
  %37 = phi i32 [ %20, %26 ], [ %54, %93 ]
  %38 = phi i32 [ %21, %26 ], [ %55, %93 ]
  %39 = phi i32 [ %22, %26 ], [ %54, %93 ]
  %40 = phi i32 [ %23, %26 ], [ %55, %93 ]
  %41 = icmp slt i32 %storemerge1, 5
  br i1 %41, label %42, label %95

42:                                               ; preds = %32
  %43 = add nsw i32 %storemerge1, 1
  %44 = sext i32 %38 to i64
  %45 = sext i32 %37 to i64
  %46 = getelementptr inbounds [5 x i32], ptr %0, i64 %44, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = mul nsw i32 %47, %43
  store i32 %48, ptr %46, align 4
  br label %49

49:                                               ; preds = %91, %42
  %storemerge2 = phi i32 [ 0, %42 ], [ %92, %91 ]
  %50 = phi i32 [ %33, %42 ], [ %66, %91 ]
  %51 = phi i32 [ %34, %42 ], [ %67, %91 ]
  %52 = phi i32 [ %35, %42 ], [ %68, %91 ]
  %53 = phi i32 [ %36, %42 ], [ %69, %91 ]
  %54 = phi i32 [ %37, %42 ], [ %68, %91 ]
  %55 = phi i32 [ %38, %42 ], [ %69, %91 ]
  %56 = icmp slt i32 %storemerge2, 5
  br i1 %56, label %57, label %93

57:                                               ; preds = %49
  %58 = add nsw i32 %55, %54
  %59 = mul nsw i32 %storemerge2, %58
  %60 = sext i32 %53 to i64
  %61 = sext i32 %52 to i64
  %62 = getelementptr inbounds [5 x i32], ptr %0, i64 %60, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = sub nsw i32 %63, %59
  store i32 %64, ptr %62, align 4
  br label %65

65:                                               ; preds = %86, %57
  %storemerge3 = phi i32 [ 0, %57 ], [ %90, %86 ]
  %66 = phi i32 [ %50, %57 ], [ %88, %86 ]
  %67 = phi i32 [ %51, %57 ], [ %89, %86 ]
  %68 = phi i32 [ %52, %57 ], [ %88, %86 ]
  %69 = phi i32 [ %53, %57 ], [ %89, %86 ]
  %70 = icmp slt i32 %storemerge3, 5
  br i1 %70, label %71, label %91

71:                                               ; preds = %65
  %72 = and i32 %storemerge3, 1
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %80

74:                                               ; preds = %71
  %75 = sext i32 %3 to i64
  %76 = sext i32 %12 to i64
  %77 = getelementptr inbounds [5 x i32], ptr %0, i64 %75, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = add nsw i32 %78, %storemerge3
  store i32 %79, ptr %77, align 4
  br label %86

80:                                               ; preds = %71
  %81 = sext i32 %67 to i64
  %82 = sext i32 %66 to i64
  %83 = getelementptr inbounds [5 x i32], ptr %0, i64 %81, i64 %82
  %84 = load i32, ptr %83, align 4
  %85 = sub nsw i32 %84, %storemerge3
  store i32 %85, ptr %83, align 4
  br label %86

86:                                               ; preds = %74, %80
  %87 = phi i32 [ %storemerge3, %74 ], [ %storemerge3, %80 ]
  %88 = phi i32 [ %12, %74 ], [ %66, %80 ]
  %89 = phi i32 [ %3, %74 ], [ %67, %80 ]
  %90 = add nsw i32 %87, 1
  br label %65, !llvm.loop !9

91:                                               ; preds = %65
  %92 = add nsw i32 %storemerge2, 1
  br label %49, !llvm.loop !10

93:                                               ; preds = %49
  %94 = add nsw i32 %storemerge1, 1
  br label %32, !llvm.loop !11

95:                                               ; preds = %32
  %96 = add nsw i32 %storemerge, 1
  br label %15, !llvm.loop !12

97:                                               ; preds = %15
  %98 = add nsw i32 %22, 1
  br label %6, !llvm.loop !13

99:                                               ; preds = %6
  %100 = add nsw i32 %11, 1
  br label %2, !llvm.loop !14

101:                                              ; preds = %2
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
