; ModuleID = 'custom3_unoptimized.ll'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@2 = private unnamed_addr constant [18 x i8] c"Original Matrix:\0A\00", align 1
@3 = private unnamed_addr constant [21 x i8] c"Manipulated Matrix:\0A\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Original Matrix:\00", align 1
@str.1 = private unnamed_addr constant [20 x i8] c"Manipulated Matrix:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %3, %1
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %3 ], [ 0, %1 ]
  %exitcond7 = icmp ne i64 %indvars.iv4, 5
  br i1 %exitcond7, label %3, label %19

3:                                                ; preds = %2
  %4 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv4, i64 0
  %5 = load i32, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %5) #4
  %7 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv4, i64 1
  %8 = load i32, ptr %7, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %8) #4
  %10 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv4, i64 2
  %11 = load i32, ptr %10, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %11) #4
  %13 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv4, i64 3
  %14 = load i32, ptr %13, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %14) #4
  %16 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv4, i64 4
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i32 noundef %17) #4
  %putchar2 = call i32 @putchar(i32 10)
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  br label %2, !llvm.loop !6

19:                                               ; preds = %2
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

9:                                                ; preds = %133, %1
  %10 = phi ptr [ %0, %1 ], [ %.lcssa46, %133 ]
  %11 = phi ptr [ %0, %1 ], [ %.lcssa45, %133 ]
  %12 = phi ptr [ %0, %1 ], [ %.lcssa44, %133 ]
  %13 = phi ptr [ %0, %1 ], [ %.lcssa43, %133 ]
  %14 = phi i32 [ 0, %1 ], [ %134, %133 ]
  store i32 %14, ptr %3, align 4
  %15 = icmp slt i32 %14, 5
  br i1 %15, label %16, label %135

16:                                               ; preds = %9, %131
  %17 = phi i32 [ %.lcssa41, %131 ], [ %14, %9 ]
  %18 = phi ptr [ %.lcssa40, %131 ], [ %10, %9 ]
  %19 = phi ptr [ %.lcssa39, %131 ], [ %11, %9 ]
  %20 = phi i32 [ %.lcssa38, %131 ], [ %14, %9 ]
  %21 = phi i32 [ %.lcssa37, %131 ], [ %14, %9 ]
  %22 = phi ptr [ %.lcssa36, %131 ], [ %12, %9 ]
  %23 = phi i32 [ %.lcssa34, %131 ], [ %14, %9 ]
  %24 = phi ptr [ %.lcssa33, %131 ], [ %13, %9 ]
  %25 = phi i32 [ %.lcssa32, %131 ], [ %14, %9 ]
  %26 = phi i32 [ %132, %131 ], [ 0, %9 ]
  store i32 %26, ptr %4, align 4
  %27 = icmp slt i32 %26, 5
  br i1 %27, label %28, label %133

28:                                               ; preds = %16, %128
  %29 = phi i32 [ %.lcssa31, %128 ], [ %26, %16 ]
  %30 = phi i32 [ %.lcssa30, %128 ], [ %17, %16 ]
  %31 = phi ptr [ %.lcssa29, %128 ], [ %18, %16 ]
  %32 = phi ptr [ %.lcssa28, %128 ], [ %19, %16 ]
  %33 = phi i32 [ %.lcssa27, %128 ], [ %26, %16 ]
  %34 = phi i32 [ %.lcssa26, %128 ], [ %20, %16 ]
  %35 = phi i32 [ %.lcssa25, %128 ], [ %26, %16 ]
  %36 = phi i32 [ %.lcssa24, %128 ], [ %21, %16 ]
  %37 = phi ptr [ %.lcssa23, %128 ], [ %22, %16 ]
  %38 = phi i32 [ %.lcssa22, %128 ], [ %26, %16 ]
  %39 = phi i32 [ %.lcssa21, %128 ], [ %23, %16 ]
  %40 = phi ptr [ %.lcssa20, %128 ], [ %24, %16 ]
  %41 = phi i32 [ %.lcssa21, %128 ], [ %25, %16 ]
  %42 = phi i32 [ %130, %128 ], [ 0, %16 ]
  store i32 %42, ptr %5, align 4
  %43 = icmp slt i32 %42, 5
  br i1 %43, label %44, label %131

44:                                               ; preds = %28
  %45 = sext i32 %39 to i64
  %46 = sext i32 %38 to i64
  %47 = getelementptr inbounds [5 x i32], ptr %40, i64 %45, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = add nsw i32 %48, %42
  store i32 %49, ptr %47, align 4
  br label %50

50:                                               ; preds = %125, %44
  %51 = phi i32 [ %29, %44 ], [ %.lcssa19, %125 ]
  %52 = phi i32 [ %30, %44 ], [ %.lcssa18, %125 ]
  %53 = phi ptr [ %31, %44 ], [ %.lcssa17, %125 ]
  %54 = phi ptr [ %32, %44 ], [ %.lcssa16, %125 ]
  %55 = phi i32 [ %33, %44 ], [ %.lcssa15, %125 ]
  %56 = phi i32 [ %34, %44 ], [ %.lcssa14, %125 ]
  %57 = phi i32 [ %35, %44 ], [ %.lcssa13, %125 ]
  %58 = phi i32 [ %36, %44 ], [ %.lcssa12, %125 ]
  %59 = phi ptr [ %37, %44 ], [ %.lcssa11, %125 ]
  %60 = phi i32 [ %38, %44 ], [ %.lcssa13, %125 ]
  %61 = phi i32 [ %39, %44 ], [ %.lcssa12, %125 ]
  %62 = phi ptr [ %40, %44 ], [ %.lcssa11, %125 ]
  %63 = phi i32 [ 0, %44 ], [ %127, %125 ]
  store i32 %63, ptr %6, align 4
  %64 = icmp slt i32 %63, 5
  br i1 %64, label %65, label %128

65:                                               ; preds = %50
  %66 = add nsw i32 %63, 1
  %67 = sext i32 %58 to i64
  %68 = sext i32 %57 to i64
  %69 = getelementptr inbounds [5 x i32], ptr %59, i64 %67, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = mul nsw i32 %70, %66
  store i32 %71, ptr %69, align 4
  br label %72

72:                                               ; preds = %122, %65
  %73 = phi i32 [ %51, %65 ], [ %.lcssa10, %122 ]
  %74 = phi i32 [ %52, %65 ], [ %.lcssa9, %122 ]
  %75 = phi ptr [ %53, %65 ], [ %.lcssa8, %122 ]
  %76 = phi ptr [ %54, %65 ], [ %.lcssa7, %122 ]
  %77 = phi i32 [ %55, %65 ], [ %.lcssa6, %122 ]
  %78 = phi i32 [ %56, %65 ], [ %.lcssa, %122 ]
  %79 = phi i32 [ %57, %65 ], [ %.lcssa6, %122 ]
  %80 = phi i32 [ %58, %65 ], [ %.lcssa, %122 ]
  %81 = phi ptr [ %59, %65 ], [ %.lcssa7, %122 ]
  %82 = phi i32 [ 0, %65 ], [ %124, %122 ]
  store i32 %82, ptr %7, align 4
  %83 = icmp slt i32 %82, 5
  br i1 %83, label %84, label %125

84:                                               ; preds = %72
  %85 = add nsw i32 %77, %78
  %86 = mul nsw i32 %85, %82
  %87 = sext i32 %78 to i64
  %88 = sext i32 %77 to i64
  %89 = getelementptr inbounds [5 x i32], ptr %76, i64 %87, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = sub nsw i32 %90, %86
  store i32 %91, ptr %89, align 4
  br label %92

92:                                               ; preds = %116, %84
  %93 = phi i32 [ %73, %84 ], [ %118, %116 ]
  %94 = phi i32 [ %74, %84 ], [ %119, %116 ]
  %95 = phi ptr [ %75, %84 ], [ %120, %116 ]
  %96 = phi ptr [ %76, %84 ], [ %120, %116 ]
  %97 = phi i32 [ %77, %84 ], [ %118, %116 ]
  %98 = phi i32 [ %78, %84 ], [ %119, %116 ]
  %99 = phi i32 [ 0, %84 ], [ %121, %116 ]
  store i32 %99, ptr %8, align 4
  %100 = icmp slt i32 %99, 5
  br i1 %100, label %101, label %122

101:                                              ; preds = %92
  %102 = and i32 %99, 1
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %104, label %110

104:                                              ; preds = %101
  %105 = sext i32 %14 to i64
  %106 = sext i32 %26 to i64
  %107 = getelementptr inbounds [5 x i32], ptr %0, i64 %105, i64 %106
  %108 = load i32, ptr %107, align 4
  %109 = add nsw i32 %108, %99
  store i32 %109, ptr %107, align 4
  br label %116

110:                                              ; preds = %101
  %111 = sext i32 %94 to i64
  %112 = sext i32 %93 to i64
  %113 = getelementptr inbounds [5 x i32], ptr %95, i64 %111, i64 %112
  %114 = load i32, ptr %113, align 4
  %115 = sub nsw i32 %114, %99
  store i32 %115, ptr %113, align 4
  %.pre = load i32, ptr %8, align 4
  br label %116

116:                                              ; preds = %110, %104
  %117 = phi i32 [ %.pre, %110 ], [ %99, %104 ]
  %118 = phi i32 [ %93, %110 ], [ %26, %104 ]
  %119 = phi i32 [ %94, %110 ], [ %14, %104 ]
  %120 = phi ptr [ %95, %110 ], [ %0, %104 ]
  %121 = add nsw i32 %117, 1
  br label %92, !llvm.loop !8

122:                                              ; preds = %92
  %.lcssa10 = phi i32 [ %93, %92 ]
  %.lcssa9 = phi i32 [ %94, %92 ]
  %.lcssa8 = phi ptr [ %95, %92 ]
  %.lcssa7 = phi ptr [ %96, %92 ]
  %.lcssa6 = phi i32 [ %97, %92 ]
  %.lcssa = phi i32 [ %98, %92 ]
  %123 = load i32, ptr %7, align 4
  %124 = add nsw i32 %123, 1
  br label %72, !llvm.loop !9

125:                                              ; preds = %72
  %.lcssa19 = phi i32 [ %73, %72 ]
  %.lcssa18 = phi i32 [ %74, %72 ]
  %.lcssa17 = phi ptr [ %75, %72 ]
  %.lcssa16 = phi ptr [ %76, %72 ]
  %.lcssa15 = phi i32 [ %77, %72 ]
  %.lcssa14 = phi i32 [ %78, %72 ]
  %.lcssa13 = phi i32 [ %79, %72 ]
  %.lcssa12 = phi i32 [ %80, %72 ]
  %.lcssa11 = phi ptr [ %81, %72 ]
  %126 = load i32, ptr %6, align 4
  %127 = add nsw i32 %126, 1
  br label %50, !llvm.loop !10

128:                                              ; preds = %50
  %.lcssa31 = phi i32 [ %51, %50 ]
  %.lcssa30 = phi i32 [ %52, %50 ]
  %.lcssa29 = phi ptr [ %53, %50 ]
  %.lcssa28 = phi ptr [ %54, %50 ]
  %.lcssa27 = phi i32 [ %55, %50 ]
  %.lcssa26 = phi i32 [ %56, %50 ]
  %.lcssa25 = phi i32 [ %57, %50 ]
  %.lcssa24 = phi i32 [ %58, %50 ]
  %.lcssa23 = phi ptr [ %59, %50 ]
  %.lcssa22 = phi i32 [ %60, %50 ]
  %.lcssa21 = phi i32 [ %61, %50 ]
  %.lcssa20 = phi ptr [ %62, %50 ]
  %129 = load i32, ptr %5, align 4
  %130 = add nsw i32 %129, 1
  br label %28, !llvm.loop !11

131:                                              ; preds = %28
  %.lcssa41 = phi i32 [ %30, %28 ]
  %.lcssa40 = phi ptr [ %31, %28 ]
  %.lcssa39 = phi ptr [ %32, %28 ]
  %.lcssa38 = phi i32 [ %34, %28 ]
  %.lcssa37 = phi i32 [ %36, %28 ]
  %.lcssa36 = phi ptr [ %37, %28 ]
  %.lcssa35 = phi i32 [ %38, %28 ]
  %.lcssa34 = phi i32 [ %39, %28 ]
  %.lcssa33 = phi ptr [ %40, %28 ]
  %.lcssa32 = phi i32 [ %41, %28 ]
  %132 = add nsw i32 %.lcssa35, 1
  br label %16, !llvm.loop !12

133:                                              ; preds = %16
  %.lcssa46 = phi ptr [ %18, %16 ]
  %.lcssa45 = phi ptr [ %19, %16 ]
  %.lcssa44 = phi ptr [ %22, %16 ]
  %.lcssa43 = phi ptr [ %24, %16 ]
  %.lcssa42 = phi i32 [ %25, %16 ]
  %134 = add nsw i32 %.lcssa42, 1
  br label %9, !llvm.loop !13

135:                                              ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %3, %0
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %3 ], [ 0, %0 ]
  %exitcond7 = icmp ne i64 %indvars.iv4, 5
  br i1 %exitcond7, label %3, label %19

3:                                                ; preds = %2
  %4 = call i32 @rand() #4
  %5 = srem i32 %4, 10
  %6 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv4, i64 0
  store i32 %5, ptr %6, align 4
  %7 = call i32 @rand() #4
  %8 = srem i32 %7, 10
  %9 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv4, i64 1
  store i32 %8, ptr %9, align 4
  %10 = call i32 @rand() #4
  %11 = srem i32 %10, 10
  %12 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv4, i64 2
  store i32 %11, ptr %12, align 4
  %13 = call i32 @rand() #4
  %14 = srem i32 %13, 10
  %15 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv4, i64 3
  store i32 %14, ptr %15, align 4
  %16 = call i32 @rand() #4
  %17 = srem i32 %16, 10
  %18 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv4, i64 4
  store i32 %17, ptr %18, align 4
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  br label %2, !llvm.loop !14

19:                                               ; preds = %2
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
