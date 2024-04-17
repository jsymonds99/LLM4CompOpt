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

5:                                                ; preds = %19, %1
  %6 = phi i32 [ 0, %1 ], [ %20, %19 ]
  store i32 %6, ptr %3, align 4
  %7 = icmp slt i32 %6, 5
  br i1 %7, label %8, label %21

8:                                                ; preds = %5
  br label %9

9:                                                ; preds = %12, %8
  %10 = phi i32 [ 0, %8 ], [ %18, %12 ]
  store i32 %10, ptr %4, align 4
  %11 = icmp slt i32 %10, 5
  br i1 %11, label %12, label %19

12:                                               ; preds = %9
  %13 = sext i32 %6 to i64
  %14 = sext i32 %10 to i64
  %15 = getelementptr inbounds [5 x i32], ptr %0, i64 %13, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %16) #4
  %18 = add nsw i32 %10, 1
  br label %9, !llvm.loop !6

19:                                               ; preds = %9
  %putchar2 = call i32 @putchar(i32 10)
  %20 = add nsw i32 %6, 1
  br label %5, !llvm.loop !8

21:                                               ; preds = %5
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

9:                                                ; preds = %135, %1
  %10 = phi ptr [ %0, %1 ], [ %19, %135 ]
  %11 = phi ptr [ %0, %1 ], [ %20, %135 ]
  %12 = phi ptr [ %0, %1 ], [ %23, %135 ]
  %13 = phi ptr [ %0, %1 ], [ %25, %135 ]
  %14 = phi i32 [ 0, %1 ], [ %136, %135 ]
  store i32 %14, ptr %3, align 4
  %15 = icmp slt i32 %14, 5
  br i1 %15, label %16, label %137

16:                                               ; preds = %9
  br label %17

17:                                               ; preds = %133, %16
  %18 = phi i32 [ %14, %16 ], [ %32, %133 ]
  %19 = phi ptr [ %10, %16 ], [ %33, %133 ]
  %20 = phi ptr [ %11, %16 ], [ %34, %133 ]
  %21 = phi i32 [ %14, %16 ], [ %36, %133 ]
  %22 = phi i32 [ %14, %16 ], [ %38, %133 ]
  %23 = phi ptr [ %12, %16 ], [ %39, %133 ]
  %24 = phi i32 [ %14, %16 ], [ %41, %133 ]
  %25 = phi ptr [ %13, %16 ], [ %42, %133 ]
  %26 = phi i32 [ %14, %16 ], [ %43, %133 ]
  %27 = phi i32 [ 0, %16 ], [ %134, %133 ]
  store i32 %27, ptr %4, align 4
  %28 = icmp slt i32 %27, 5
  br i1 %28, label %29, label %135

29:                                               ; preds = %17
  br label %30

30:                                               ; preds = %130, %29
  %31 = phi i32 [ %27, %29 ], [ %53, %130 ]
  %32 = phi i32 [ %18, %29 ], [ %54, %130 ]
  %33 = phi ptr [ %19, %29 ], [ %55, %130 ]
  %34 = phi ptr [ %20, %29 ], [ %56, %130 ]
  %35 = phi i32 [ %27, %29 ], [ %57, %130 ]
  %36 = phi i32 [ %21, %29 ], [ %58, %130 ]
  %37 = phi i32 [ %27, %29 ], [ %59, %130 ]
  %38 = phi i32 [ %22, %29 ], [ %60, %130 ]
  %39 = phi ptr [ %23, %29 ], [ %61, %130 ]
  %40 = phi i32 [ %27, %29 ], [ %62, %130 ]
  %41 = phi i32 [ %24, %29 ], [ %63, %130 ]
  %42 = phi ptr [ %25, %29 ], [ %64, %130 ]
  %43 = phi i32 [ %26, %29 ], [ %63, %130 ]
  %44 = phi i32 [ 0, %29 ], [ %132, %130 ]
  store i32 %44, ptr %5, align 4
  %45 = icmp slt i32 %44, 5
  br i1 %45, label %46, label %133

46:                                               ; preds = %30
  %47 = sext i32 %41 to i64
  %48 = sext i32 %40 to i64
  %49 = getelementptr inbounds [5 x i32], ptr %42, i64 %47, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = add nsw i32 %50, %44
  store i32 %51, ptr %49, align 4
  br label %52

52:                                               ; preds = %127, %46
  %53 = phi i32 [ %31, %46 ], [ %75, %127 ]
  %54 = phi i32 [ %32, %46 ], [ %76, %127 ]
  %55 = phi ptr [ %33, %46 ], [ %77, %127 ]
  %56 = phi ptr [ %34, %46 ], [ %78, %127 ]
  %57 = phi i32 [ %35, %46 ], [ %79, %127 ]
  %58 = phi i32 [ %36, %46 ], [ %80, %127 ]
  %59 = phi i32 [ %37, %46 ], [ %81, %127 ]
  %60 = phi i32 [ %38, %46 ], [ %82, %127 ]
  %61 = phi ptr [ %39, %46 ], [ %83, %127 ]
  %62 = phi i32 [ %40, %46 ], [ %81, %127 ]
  %63 = phi i32 [ %41, %46 ], [ %82, %127 ]
  %64 = phi ptr [ %42, %46 ], [ %83, %127 ]
  %65 = phi i32 [ 0, %46 ], [ %129, %127 ]
  store i32 %65, ptr %6, align 4
  %66 = icmp slt i32 %65, 5
  br i1 %66, label %67, label %130

67:                                               ; preds = %52
  %68 = add nsw i32 %65, 1
  %69 = sext i32 %60 to i64
  %70 = sext i32 %59 to i64
  %71 = getelementptr inbounds [5 x i32], ptr %61, i64 %69, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = mul nsw i32 %72, %68
  store i32 %73, ptr %71, align 4
  br label %74

74:                                               ; preds = %124, %67
  %75 = phi i32 [ %53, %67 ], [ %95, %124 ]
  %76 = phi i32 [ %54, %67 ], [ %96, %124 ]
  %77 = phi ptr [ %55, %67 ], [ %97, %124 ]
  %78 = phi ptr [ %56, %67 ], [ %98, %124 ]
  %79 = phi i32 [ %57, %67 ], [ %99, %124 ]
  %80 = phi i32 [ %58, %67 ], [ %100, %124 ]
  %81 = phi i32 [ %59, %67 ], [ %99, %124 ]
  %82 = phi i32 [ %60, %67 ], [ %100, %124 ]
  %83 = phi ptr [ %61, %67 ], [ %98, %124 ]
  %84 = phi i32 [ 0, %67 ], [ %126, %124 ]
  store i32 %84, ptr %7, align 4
  %85 = icmp slt i32 %84, 5
  br i1 %85, label %86, label %127

86:                                               ; preds = %74
  %87 = add nsw i32 %80, %79
  %88 = mul nsw i32 %84, %87
  %89 = sext i32 %80 to i64
  %90 = sext i32 %79 to i64
  %91 = getelementptr inbounds [5 x i32], ptr %78, i64 %89, i64 %90
  %92 = load i32, ptr %91, align 4
  %93 = sub nsw i32 %92, %88
  store i32 %93, ptr %91, align 4
  br label %94

94:                                               ; preds = %118, %86
  %95 = phi i32 [ %75, %86 ], [ %120, %118 ]
  %96 = phi i32 [ %76, %86 ], [ %121, %118 ]
  %97 = phi ptr [ %77, %86 ], [ %122, %118 ]
  %98 = phi ptr [ %78, %86 ], [ %122, %118 ]
  %99 = phi i32 [ %79, %86 ], [ %120, %118 ]
  %100 = phi i32 [ %80, %86 ], [ %121, %118 ]
  %101 = phi i32 [ 0, %86 ], [ %123, %118 ]
  store i32 %101, ptr %8, align 4
  %102 = icmp slt i32 %101, 5
  br i1 %102, label %103, label %124

103:                                              ; preds = %94
  %104 = and i32 %101, 1
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %106, label %112

106:                                              ; preds = %103
  %107 = sext i32 %14 to i64
  %108 = sext i32 %27 to i64
  %109 = getelementptr inbounds [5 x i32], ptr %0, i64 %107, i64 %108
  %110 = load i32, ptr %109, align 4
  %111 = add nsw i32 %110, %101
  store i32 %111, ptr %109, align 4
  br label %118

112:                                              ; preds = %103
  %113 = sext i32 %96 to i64
  %114 = sext i32 %95 to i64
  %115 = getelementptr inbounds [5 x i32], ptr %97, i64 %113, i64 %114
  %116 = load i32, ptr %115, align 4
  %117 = sub nsw i32 %116, %101
  store i32 %117, ptr %115, align 4
  %.pre = load i32, ptr %8, align 4
  br label %118

118:                                              ; preds = %112, %106
  %119 = phi i32 [ %.pre, %112 ], [ %101, %106 ]
  %120 = phi i32 [ %95, %112 ], [ %27, %106 ]
  %121 = phi i32 [ %96, %112 ], [ %14, %106 ]
  %122 = phi ptr [ %97, %112 ], [ %0, %106 ]
  %123 = add nsw i32 %119, 1
  br label %94, !llvm.loop !9

124:                                              ; preds = %94
  %125 = load i32, ptr %7, align 4
  %126 = add nsw i32 %125, 1
  br label %74, !llvm.loop !10

127:                                              ; preds = %74
  %128 = load i32, ptr %6, align 4
  %129 = add nsw i32 %128, 1
  br label %52, !llvm.loop !11

130:                                              ; preds = %52
  %131 = load i32, ptr %5, align 4
  %132 = add nsw i32 %131, 1
  br label %30, !llvm.loop !12

133:                                              ; preds = %30
  %134 = add nsw i32 %40, 1
  br label %17, !llvm.loop !13

135:                                              ; preds = %17
  %136 = add nsw i32 %26, 1
  br label %9, !llvm.loop !14

137:                                              ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  br label %4

4:                                                ; preds = %18, %0
  %5 = phi i32 [ 0, %0 ], [ %19, %18 ]
  store i32 %5, ptr %2, align 4
  %6 = icmp slt i32 %5, 5
  br i1 %6, label %7, label %20

7:                                                ; preds = %4
  br label %8

8:                                                ; preds = %11, %7
  %9 = phi i32 [ 0, %7 ], [ %17, %11 ]
  store i32 %9, ptr %3, align 4
  %10 = icmp slt i32 %9, 5
  br i1 %10, label %11, label %18

11:                                               ; preds = %8
  %12 = call i32 @rand() #4
  %13 = srem i32 %12, 10
  %14 = sext i32 %5 to i64
  %15 = sext i32 %9 to i64
  %16 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %14, i64 %15
  store i32 %13, ptr %16, align 4
  %17 = add nsw i32 %9, 1
  br label %8, !llvm.loop !15

18:                                               ; preds = %8
  %19 = add nsw i32 %5, 1
  br label %4, !llvm.loop !16

20:                                               ; preds = %4
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
