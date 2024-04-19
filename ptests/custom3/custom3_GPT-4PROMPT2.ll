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
  %.01 = phi i32 [ 0, %1 ], [ %17, %16 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %18

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %13, %4
  %.0 = phi i32 [ 0, %4 ], [ %14, %13 ]
  %6 = icmp ult i32 %.0, 5
  br i1 %6, label %7, label %15

7:                                                ; preds = %5
  %8 = zext i32 %.01 to i64
  %9 = zext i32 %.0 to i64
  %10 = getelementptr inbounds [5 x i32], ptr %0, i64 %8, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %11) #4
  br label %13

13:                                               ; preds = %7
  %14 = add nuw nsw i32 %.0, 1
  br label %5, !llvm.loop !6

15:                                               ; preds = %5
  %putchar2 = call i32 @putchar(i32 10)
  br label %16

16:                                               ; preds = %15
  %17 = add nuw nsw i32 %.01, 1
  br label %2, !llvm.loop !8

18:                                               ; preds = %2
  %putchar = call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %68, %1
  %.01 = phi i32 [ 0, %1 ], [ %69, %68 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %70

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %65, %4
  %.02 = phi i32 [ 0, %4 ], [ %66, %65 ]
  %6 = icmp ult i32 %.02, 5
  br i1 %6, label %7, label %67

7:                                                ; preds = %5
  br label %8

8:                                                ; preds = %62, %7
  %.03 = phi i32 [ 0, %7 ], [ %63, %62 ]
  %9 = icmp ult i32 %.03, 5
  br i1 %9, label %10, label %64

10:                                               ; preds = %8
  %11 = zext i32 %.01 to i64
  %12 = zext i32 %.02 to i64
  %13 = getelementptr inbounds [5 x i32], ptr %0, i64 %11, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, %.03
  store i32 %15, ptr %13, align 4
  br label %16

16:                                               ; preds = %59, %10
  %.04 = phi i32 [ 0, %10 ], [ %60, %59 ]
  %17 = icmp ult i32 %.04, 5
  br i1 %17, label %18, label %61

18:                                               ; preds = %16
  %19 = add nuw nsw i32 %.04, 1
  %20 = zext i32 %.01 to i64
  %21 = zext i32 %.02 to i64
  %22 = getelementptr inbounds [5 x i32], ptr %0, i64 %20, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = mul nsw i32 %23, %19
  store i32 %24, ptr %22, align 4
  br label %25

25:                                               ; preds = %56, %18
  %.05 = phi i32 [ 0, %18 ], [ %57, %56 ]
  %26 = icmp ult i32 %.05, 5
  br i1 %26, label %27, label %58

27:                                               ; preds = %25
  %28 = add nuw nsw i32 %.01, %.02
  %29 = mul nsw i32 %.05, %28
  %30 = zext i32 %.01 to i64
  %31 = zext i32 %.02 to i64
  %32 = getelementptr inbounds [5 x i32], ptr %0, i64 %30, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = sub nsw i32 %33, %29
  store i32 %34, ptr %32, align 4
  br label %35

35:                                               ; preds = %53, %27
  %.0 = phi i32 [ 0, %27 ], [ %54, %53 ]
  %36 = icmp ult i32 %.0, 5
  br i1 %36, label %37, label %55

37:                                               ; preds = %35
  %38 = and i32 %.0, 1
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %46

40:                                               ; preds = %37
  %41 = zext i32 %.01 to i64
  %42 = zext i32 %.02 to i64
  %43 = getelementptr inbounds [5 x i32], ptr %0, i64 %41, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = add nsw i32 %44, %.0
  store i32 %45, ptr %43, align 4
  br label %52

46:                                               ; preds = %37
  %47 = zext i32 %.01 to i64
  %48 = zext i32 %.02 to i64
  %49 = getelementptr inbounds [5 x i32], ptr %0, i64 %47, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = sub nsw i32 %50, %.0
  store i32 %51, ptr %49, align 4
  br label %52

52:                                               ; preds = %46, %40
  br label %53

53:                                               ; preds = %52
  %54 = add nuw nsw i32 %.0, 1
  br label %35, !llvm.loop !9

55:                                               ; preds = %35
  br label %56

56:                                               ; preds = %55
  %57 = add nuw nsw i32 %.05, 1
  br label %25, !llvm.loop !10

58:                                               ; preds = %25
  br label %59

59:                                               ; preds = %58
  %60 = add nuw nsw i32 %.04, 1
  br label %16, !llvm.loop !11

61:                                               ; preds = %16
  br label %62

62:                                               ; preds = %61
  %63 = add nuw nsw i32 %.03, 1
  br label %8, !llvm.loop !12

64:                                               ; preds = %8
  br label %65

65:                                               ; preds = %64
  %66 = add nuw nsw i32 %.02, 1
  br label %5, !llvm.loop !13

67:                                               ; preds = %5
  br label %68

68:                                               ; preds = %67
  %69 = add nuw nsw i32 %.01, 1
  br label %2, !llvm.loop !14

70:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %16, %0
  %.01 = phi i32 [ 0, %0 ], [ %17, %16 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %18

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %13, %4
  %.0 = phi i32 [ 0, %4 ], [ %14, %13 ]
  %6 = icmp ult i32 %.0, 5
  br i1 %6, label %7, label %15

7:                                                ; preds = %5
  %8 = call i32 @rand() #4
  %9 = srem i32 %8, 10
  %10 = zext i32 %.01 to i64
  %11 = zext i32 %.0 to i64
  %12 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %10, i64 %11
  store i32 %9, ptr %12, align 4
  br label %13

13:                                               ; preds = %7
  %14 = add nuw nsw i32 %.0, 1
  br label %5, !llvm.loop !15

15:                                               ; preds = %5
  br label %16

16:                                               ; preds = %15
  %17 = add nuw nsw i32 %.01, 1
  br label %2, !llvm.loop !16

18:                                               ; preds = %2
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1)
  call void @manipulateMatrix(ptr noundef nonnull %1)
  %puts2 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
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
