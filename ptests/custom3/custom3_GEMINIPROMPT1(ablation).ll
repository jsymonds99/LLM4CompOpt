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
  br label %.preheader

.preheader:                                       ; preds = %1, %27
  %indvars.iv38 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %27 ]
  br label %2

2:                                                ; preds = %.preheader
  br label %3

3:                                                ; preds = %2
  %4 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv38, i64 0
  %5 = load i32, ptr %4, align 4
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %5) #4
  br label %7

7:                                                ; preds = %3
  %8 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv38, i64 1
  %9 = load i32, ptr %8, align 4
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %9) #4
  br label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv38, i64 2
  %13 = load i32, ptr %12, align 4
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %13) #4
  br label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv38, i64 3
  %17 = load i32, ptr %16, align 4
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %17) #4
  br label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv38, i64 4
  %21 = load i32, ptr %20, align 4
  %22 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %21) #4
  br i1 false, label %23, label %27

23:                                               ; preds = %19
  %indvars.iv3.lcssa7 = phi i64 [ %indvars.iv38, %19 ]
  %24 = getelementptr inbounds [5 x i32], ptr %0, i64 %indvars.iv3.lcssa7, i64 5
  %25 = load i32, ptr %24, align 4
  %26 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %25) #4
  unreachable

27:                                               ; preds = %19
  %putchar1 = tail call i32 @putchar(i32 10)
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond6 = icmp ne i64 %indvars.iv.next4, 5
  br i1 %exitcond6, label %.preheader, label %28, !llvm.loop !6

28:                                               ; preds = %27
  %putchar = tail call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  br label %.preheader4

.preheader4:                                      ; preds = %1, %84
  %2 = phi i32 [ 0, %1 ], [ %85, %84 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader4, %81
  %3 = phi i32 [ 0, %.preheader4 ], [ %82, %81 ]
  %4 = phi i32 [ %2, %.preheader4 ], [ %.lcssa23, %81 ]
  %5 = phi i32 [ %2, %.preheader4 ], [ %.lcssa25, %81 ]
  %6 = phi i32 [ %2, %.preheader4 ], [ %.lcssa26, %81 ]
  %7 = phi i32 [ %2, %.preheader4 ], [ %.lcssa27, %81 ]
  br label %8

8:                                                ; preds = %.preheader, %78
  %.0 = phi i32 [ 0, %.preheader ], [ %79, %78 ]
  %9 = phi i32 [ %4, %.preheader ], [ %.lcssa14, %78 ]
  %10 = phi i32 [ %3, %.preheader ], [ %.lcssa15, %78 ]
  %11 = phi i32 [ %5, %.preheader ], [ %.lcssa16, %78 ]
  %12 = phi i32 [ %3, %.preheader ], [ %.lcssa17, %78 ]
  %13 = phi i32 [ %6, %.preheader ], [ %.lcssa18, %78 ]
  %14 = phi i32 [ %3, %.preheader ], [ %.lcssa19, %78 ]
  %15 = phi i32 [ %7, %.preheader ], [ %.lcssa20, %78 ]
  %16 = phi i32 [ %3, %.preheader ], [ %.lcssa21, %78 ]
  %storemerge32 = phi i32 [ 0, %.preheader ], [ %79, %78 ]
  %17 = sext i32 %9 to i64
  %18 = sext i32 %10 to i64
  %19 = getelementptr inbounds [5 x i32], ptr %0, i64 %17, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = add nsw i32 %20, %storemerge32
  store i32 %21, ptr %19, align 4
  br label %22

22:                                               ; preds = %8, %75
  %.033 = phi i32 [ 0, %8 ], [ %76, %75 ]
  %23 = phi i32 [ %11, %8 ], [ %.lcssa8, %75 ]
  %24 = phi i32 [ %12, %8 ], [ %.lcssa9, %75 ]
  %25 = phi i32 [ %13, %8 ], [ %.lcssa10, %75 ]
  %26 = phi i32 [ %14, %8 ], [ %.lcssa11, %75 ]
  %27 = phi i32 [ %15, %8 ], [ %.lcssa12, %75 ]
  %28 = phi i32 [ %16, %8 ], [ %.lcssa13, %75 ]
  %storemerge131 = phi i32 [ 0, %8 ], [ %76, %75 ]
  %29 = add nsw i32 %storemerge131, 1
  %30 = sext i32 %23 to i64
  %31 = sext i32 %24 to i64
  %32 = getelementptr inbounds [5 x i32], ptr %0, i64 %30, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = mul nsw i32 %33, %29
  store i32 %34, ptr %32, align 4
  br label %35

35:                                               ; preds = %22, %72
  %.034 = phi i32 [ 0, %22 ], [ %73, %72 ]
  %36 = phi i32 [ %23, %22 ], [ %.lcssa, %72 ]
  %37 = phi i32 [ %24, %22 ], [ %.lcssa5, %72 ]
  %38 = phi i32 [ %25, %22 ], [ %.lcssa, %72 ]
  %39 = phi i32 [ %26, %22 ], [ %.lcssa5, %72 ]
  %40 = phi i32 [ %27, %22 ], [ %.lcssa6, %72 ]
  %41 = phi i32 [ %28, %22 ], [ %.lcssa7, %72 ]
  %storemerge230 = phi i32 [ 0, %22 ], [ %73, %72 ]
  %42 = add nsw i32 %36, %37
  %43 = mul nsw i32 %storemerge230, %42
  %44 = sext i32 %38 to i64
  %45 = sext i32 %39 to i64
  %46 = getelementptr inbounds [5 x i32], ptr %0, i64 %44, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = sub nsw i32 %47, %43
  store i32 %48, ptr %46, align 4
  br label %49

49:                                               ; preds = %35, %66
  %.035 = phi i32 [ 0, %35 ], [ %70, %66 ]
  %50 = phi i32 [ %40, %35 ], [ %69, %66 ]
  %51 = phi i32 [ %41, %35 ], [ %68, %66 ]
  %storemerge329 = phi i32 [ 0, %35 ], [ %70, %66 ]
  %52 = and i32 %storemerge329, 1
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %60

54:                                               ; preds = %49
  %55 = sext i32 %2 to i64
  %56 = sext i32 %3 to i64
  %57 = getelementptr inbounds [5 x i32], ptr %0, i64 %55, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = add nsw i32 %58, %storemerge329
  store i32 %59, ptr %57, align 4
  br label %66

60:                                               ; preds = %49
  %61 = sext i32 %50 to i64
  %62 = sext i32 %51 to i64
  %63 = getelementptr inbounds [5 x i32], ptr %0, i64 %61, i64 %62
  %64 = load i32, ptr %63, align 4
  %65 = sub nsw i32 %64, %storemerge329
  store i32 %65, ptr %63, align 4
  br label %66

66:                                               ; preds = %60, %54
  %67 = phi i32 [ %.035, %60 ], [ %storemerge329, %54 ]
  %68 = phi i32 [ %51, %60 ], [ %3, %54 ]
  %69 = phi i32 [ %50, %60 ], [ %2, %54 ]
  %70 = add nsw i32 %67, 1
  %71 = icmp slt i32 %70, 5
  br i1 %71, label %49, label %72, !llvm.loop !8

72:                                               ; preds = %66
  %.lcssa7 = phi i32 [ %68, %66 ]
  %.lcssa6 = phi i32 [ %69, %66 ]
  %.lcssa5 = phi i32 [ %68, %66 ]
  %.lcssa = phi i32 [ %69, %66 ]
  %73 = add nsw i32 %.034, 1
  %74 = icmp slt i32 %73, 5
  br i1 %74, label %35, label %75, !llvm.loop !9

75:                                               ; preds = %72
  %.lcssa13 = phi i32 [ %.lcssa7, %72 ]
  %.lcssa12 = phi i32 [ %.lcssa6, %72 ]
  %.lcssa11 = phi i32 [ %.lcssa5, %72 ]
  %.lcssa10 = phi i32 [ %.lcssa, %72 ]
  %.lcssa9 = phi i32 [ %.lcssa5, %72 ]
  %.lcssa8 = phi i32 [ %.lcssa, %72 ]
  %76 = add nsw i32 %.033, 1
  %77 = icmp slt i32 %76, 5
  br i1 %77, label %22, label %78, !llvm.loop !10

78:                                               ; preds = %75
  %.lcssa21 = phi i32 [ %.lcssa13, %75 ]
  %.lcssa20 = phi i32 [ %.lcssa12, %75 ]
  %.lcssa19 = phi i32 [ %.lcssa11, %75 ]
  %.lcssa18 = phi i32 [ %.lcssa10, %75 ]
  %.lcssa17 = phi i32 [ %.lcssa9, %75 ]
  %.lcssa16 = phi i32 [ %.lcssa8, %75 ]
  %.lcssa15 = phi i32 [ %.lcssa9, %75 ]
  %.lcssa14 = phi i32 [ %.lcssa8, %75 ]
  %79 = add nsw i32 %.0, 1
  %80 = icmp slt i32 %79, 5
  br i1 %80, label %8, label %81, !llvm.loop !11

81:                                               ; preds = %78
  %.lcssa27 = phi i32 [ %.lcssa20, %78 ]
  %.lcssa26 = phi i32 [ %.lcssa18, %78 ]
  %.lcssa25 = phi i32 [ %.lcssa16, %78 ]
  %.lcssa24 = phi i32 [ %.lcssa15, %78 ]
  %.lcssa23 = phi i32 [ %.lcssa14, %78 ]
  %.lcssa22 = phi i32 [ %.lcssa14, %78 ]
  %82 = add nsw i32 %.lcssa24, 1
  %83 = icmp slt i32 %82, 5
  br i1 %83, label %.preheader, label %84, !llvm.loop !12

84:                                               ; preds = %81
  %.lcssa28 = phi i32 [ %.lcssa22, %81 ]
  %85 = add nsw i32 %.lcssa28, 1
  %86 = icmp slt i32 %85, 5
  br i1 %86, label %.preheader4, label %87, !llvm.loop !13

87:                                               ; preds = %84
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %.preheader

.preheader:                                       ; preds = %0, %27
  %indvars.iv38 = phi i64 [ 0, %0 ], [ %indvars.iv.next4, %27 ]
  br label %2

2:                                                ; preds = %.preheader
  br label %3

3:                                                ; preds = %2
  %4 = tail call i32 @rand() #4
  %5 = srem i32 %4, 10
  %6 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv38, i64 0
  store i32 %5, ptr %6, align 4
  br label %7

7:                                                ; preds = %3
  %8 = tail call i32 @rand() #4
  %9 = srem i32 %8, 10
  %10 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv38, i64 1
  store i32 %9, ptr %10, align 4
  br label %11

11:                                               ; preds = %7
  %12 = tail call i32 @rand() #4
  %13 = srem i32 %12, 10
  %14 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv38, i64 2
  store i32 %13, ptr %14, align 4
  br label %15

15:                                               ; preds = %11
  %16 = tail call i32 @rand() #4
  %17 = srem i32 %16, 10
  %18 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv38, i64 3
  store i32 %17, ptr %18, align 4
  br label %19

19:                                               ; preds = %15
  %20 = tail call i32 @rand() #4
  %21 = srem i32 %20, 10
  %22 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv38, i64 4
  store i32 %21, ptr %22, align 4
  br i1 false, label %23, label %27

23:                                               ; preds = %19
  %indvars.iv3.lcssa7 = phi i64 [ %indvars.iv38, %19 ]
  %24 = tail call i32 @rand() #4
  %25 = srem i32 %24, 10
  %26 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %indvars.iv3.lcssa7, i64 5
  store i32 %25, ptr %26, align 4
  unreachable

27:                                               ; preds = %19
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond6 = icmp ne i64 %indvars.iv.next4, 5
  br i1 %exitcond6, label %.preheader, label %28, !llvm.loop !14

28:                                               ; preds = %27
  %puts = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
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
